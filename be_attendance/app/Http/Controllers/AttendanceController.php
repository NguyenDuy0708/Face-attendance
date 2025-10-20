<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\AttendanceRecord;
use App\Models\Student;
use App\Models\AttendanceSession;

class AttendanceController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'image' => 'required',
            'session_id' => 'required|exists:attendance_sessions,id',
        ]);

        $response = Http::post(env('AI_SERVICE_URL') . '/recognize', [
            'image' => $request->image,
        ]);

        if ($response->failed()) {
            return response()->json(['message' => 'Failed to connect to AI service'], 500);
        }

        $data = $response->json();

        if (!$data['matched']) {
            return response()->json(['message' => 'Face not recognized'], 404);
        }

        $student = Student::where('student_code', $data['student_id'])->first();

        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }

        $attendanceRecord = AttendanceRecord::create([
            'session_id' => $request->session_id,
            'student_id' => $student->id,
            'check_in_time' => now(),
            'status' => 'present',
            'confidence' => $data['confidence'],
        ]);

        return $attendanceRecord;
    }
}
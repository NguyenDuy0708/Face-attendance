import 'package:go_router/go_router.dart';
import '../ui/screens/shared/splash_screen.dart';
import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/student/home_screen.dart';
import '../ui/screens/student/attendance_screen.dart';
import '../ui/screens/student/history_screen.dart';
import '../ui/screens/teacher/teacher_home.dart';
import '../ui/screens/teacher/report_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String studentHome = '/student/home';
  static const String studentAttendance = '/student/attendance';
  static const String studentHistory = '/student/history';
  static const String teacherHome = '/teacher/home';
  static const String teacherReport = '/teacher/report';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (ctx, state) => const SplashScreen(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (ctx, state) => const LoginScreen(),
      ),
      GoRoute(
        path: studentHome,
        name: 'studentHome',
        builder: (ctx, state) => const StudentHomeScreen(),
      ),
      GoRoute(
        path: studentAttendance,
        name: 'studentAttendance',
        builder: (ctx, state) => const AttendanceScreen(),
      ),
      GoRoute(
        path: studentHistory,
        name: 'studentHistory',
        builder: (ctx, state) => const HistoryScreen(),
      ),
      GoRoute(
        path: teacherHome,
        name: 'teacherHome',
        builder: (ctx, state) => const TeacherHomeScreen(),
      ),
      GoRoute(
        path: teacherReport,
        name: 'teacherReport',
        builder: (ctx, state) => const ReportScreen(),
      ),
    ],
  );
}

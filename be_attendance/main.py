from fastapi import FastAPI, File, UploadFile
from pydantic import BaseModel
import face_recognition
import numpy as np
import base64
import io

app = FastAPI()

# In-memory storage for known face encodings
known_face_encodings = []
known_face_ids = []

class Image(BaseModel):
    image: str

@app.post("/recognize")
async def recognize(image: Image):
    try:
        # Decode the base64 image
        image_data = base64.b64decode(image.image)
        image_stream = io.BytesIO(image_data)
        image = face_recognition.load_image_file(image_stream)

        # Find all the faces and face encodings in the current frame of video
        face_locations = face_recognition.face_locations(image)
        face_encodings = face_recognition.face_encodings(image, face_locations)

        for face_encoding in face_encodings:
            # See if the face is a match for the known face(s)
            matches = face_recognition.compare_faces(known_face_encodings, face_encoding)
            name = "Unknown"
            confidence = 0.0

            # Or instead, use the known face with the smallest distance to the new face
            face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
            best_match_index = np.argmin(face_distances)
            if matches[best_match_index]:
                name = known_face_ids[best_match_index]
                confidence = 1 - face_distances[best_match_index]

            return {"matched": True, "student_id": name, "confidence": confidence}

    except Exception as e:
        return {"matched": False, "error": str(e)}

    return {"matched": False, "error": "No face found"}

@app.on_event("startup")
async def startup_event():
    # Load known faces on startup
    # This is just an example. You should load this from a database or a folder.
    # For example, you could have a folder with images of students, where the filename is the student_id.
    # Then you can loop through the folder, load each image, and get the face encoding.
    # For now, we will just use a dummy example.

    # student1_image = face_recognition.load_image_file("path/to/student1.jpg")
    # student1_face_encoding = face_recognition.face_encodings(student1_image)[0]
    # known_face_encodings.append(student1_face_encoding)
    # known_face_ids.append("SV001")
    pass

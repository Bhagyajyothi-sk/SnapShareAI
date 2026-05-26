import face_recognition
import numpy as np

def generate_face_encoding(image_path):
    try:
        # Load image
        image = face_recognition.load_image_file(image_path)

        # Generate face encodings
        encodings = face_recognition.face_encodings(image)

        # Check if face found
        if len(encodings) == 0:
            return None

        # Return first face encoding
        return encodings[0].tolist()

    except Exception as e:
        print("Face Encoding Error:", str(e))
        return None
    
def compare_faces(known_encoding, unknown_encoding):

    known_encoding = np.array(known_encoding)

    results = face_recognition.compare_faces(
        [known_encoding],
        unknown_encoding
    )

    return results[0]

def get_faces_from_image(image_path):

    image = face_recognition.load_image_file(image_path)

    face_encodings = face_recognition.face_encodings(image)

    return face_encodings
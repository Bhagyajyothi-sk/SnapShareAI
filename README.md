# SnapShareAI – AI-Powered Photo Sharing Platform

An AI-powered photo sharing platform that uses facial recognition to automatically identify people in group photos and deliver images to the correct recipients via email.

---

## Project Overview

SnapShareAI is a full-stack mobile application that automates the process of sharing group photos after events, meetings, gatherings, and celebrations.

Instead of manually selecting and sending photos to each person, the system uses Artificial Intelligence and Facial Recognition to detect individuals in uploaded images, match them with registered contacts, and automatically deliver the photos through email.

The platform combines Flutter mobile development, FastAPI backend services, MongoDB Atlas cloud database, and computer vision technologies to create a seamless photo-sharing experience.

---

## Problem Statement

After capturing group photos, users often need to manually identify people and send images individually.

This traditional process is:

* Time-consuming
* Repetitive
* Difficult to manage for large groups
* Prone to mistakes

SnapShareAI solves this problem by automating photo identification and delivery using facial recognition technology.

---

## Key Features

* Secure User Authentication
* Contact Management System
* Facial Recognition-Based Identification
* Automatic Photo Delivery via Email
* Cloud Database Integration
* Delivery History Tracking
* FastAPI REST API Backend
* Flutter Mobile Application
* MongoDB Atlas Integration
* AI-Powered Face Matching
* Modern Mobile User Interface

---
## 📸 Application Screenshots

### Landing Page
![Landing](screenshots/Screenshot%202026-06-07%20205622.png)

### Login Page
![Login](screenshots/Screenshot%202026-06-07%20205645.png)

### Registration Page
![Register](screenshots/Screenshot%202026-06-07%20205702.png)

### Dashboard
![Dashboard](screenshots/Screenshot%202026-06-07%20211836.png)

### Dashboard – Quick Actions
![Dashboard Quick Actions](screenshots/Screenshot%202026-06-07%20211851.png)

### Contacts Management
![Contacts](screenshots/Screenshot%202026-06-07%20211907.png)

### AI Face Scan
![Scan](screenshots/Screenshot%202026-06-07%20211922.png)

### Delivery History
![History](screenshots/Screenshot%202026-06-07%20211938.png)

### Profile
![Profile](screenshots/Screenshot%202026-06-07%20211955.png)

### Profile Settings & Logout
![Profile Logout](screenshots/Screenshot%202026-06-07%20212008.png)

## System Architecture

```text
Flutter Mobile Application
            │
            ▼
      FastAPI Backend
            │
            ▼
     MongoDB Atlas
            │
            ▼
 Face Recognition Engine
            │
            ▼
 Email Delivery Service
```

---

## Complete Workflow

### Step 1 – User Registration

Users create an account through the Flutter application.

The backend stores:

* Name
* Email Address
* Encrypted Password

inside MongoDB Atlas.

---

### Step 2 – User Login

Users log into the application using their credentials.

The FastAPI backend verifies:

* Email
* Password

and grants access to the dashboard.

---

### Step 3 – Contact Registration

Users add contacts who should receive photos.

For each contact:

* Name
* Email Address
* Reference Face Image

are uploaded and processed.

The facial recognition engine generates facial encodings that are stored inside MongoDB Atlas.

---

### Step 4 – Group Photo Upload

Users upload a group photo through the Scan module.

The image is sent to the FastAPI backend for processing.

---

### Step 5 – Face Detection

The AI engine scans the uploaded image and detects all visible faces.

For every detected face, a facial encoding is generated.

---

### Step 6 – Face Matching

Each detected face is compared against all registered contact encodings.

Matching Process:

```text
Detected Face
      │
      ▼
Compare With Registered Contacts
      │
      ▼
Find Matching Face
      │
      ▼
Identify Contact
```

If a match is found, the corresponding contact information is retrieved.

---

### Step 7 – Automatic Email Delivery

For every matched contact, the system automatically sends an email containing the group photo.

Example:

```text
Hello Rahul,

You were identified in a recently uploaded group photo.

Your photo is attached below.

Regards,
SnapShareAI
```

No manual intervention is required.

---

### Step 8 – Delivery History Logging

After processing is completed, the system stores:

* Filename
* Total Faces Detected
* Matched Contacts
* Delivery Status

This information is displayed inside the History section of the application.

---

## Dashboard Modules

### Home

Displays:

* Application Overview
* AI System Information
* Quick Navigation

### Contacts

Allows users to:

* Add Contacts
* Upload Reference Images
* Manage Recipient Database

### Scan

Allows users to:

* Upload Group Photos
* Trigger Face Recognition
* Start Automatic Delivery

### History

Displays:

* Previous Uploads
* Face Detection Results
* Delivery Status
* Matched Contacts

### Profile

Displays:

* User Information
* Account Settings
* Logout Functionality

---

## Technology Stack

### Frontend

* Flutter
* Dart

### Backend

* FastAPI
* Python

### Database

* MongoDB Atlas

### AI & Computer Vision

* face_recognition
* dlib

### Authentication

* JWT Authentication
* Password Hashing

### Email Service

* SMTP
* Gmail App Password Integration

### Version Control

* Git
* GitHub

---

## Project Structure

```text
SnapShareAI/
│
├── backend/
│   ├── models/
│   ├── routers/
│   ├── services/
│   ├── uploads/
│   ├── config.py
│   ├── database.py
│   ├── main.py
│   └── requirements.txt
│
├── snapshare_mobile/
│   ├── lib/
│   ├── android/
│   ├── ios/
│   ├── web/
│   └── pubspec.yaml
│
├── README.md
├── runtime.txt
└── .gitignore
```

---

## Setup & Run

### Backend Setup

```bash
cd backend

pip install -r requirements.txt

uvicorn main:app --reload
```

### Flutter App Setup

```bash
cd snapshare_mobile

flutter pub get

flutter run
```

---

## Future Enhancements

### Automatic Gallery Scanning

Automatically monitor selected folders and process newly added photos.

### WhatsApp Integration

Deliver matched photos through WhatsApp Business APIs.

### Cloud AI Processing

Move face recognition workloads to dedicated cloud infrastructure.

### Push Notifications

Notify users after successful photo delivery.

### Multi-Device Synchronization

Access contacts and history across multiple devices.

---

## Learning Outcomes

This project demonstrates practical experience in:

* Mobile App Development
* REST API Development
* MongoDB Database Integration
* Authentication Systems
* Facial Recognition
* Computer Vision
* Email Automation
* Cloud-Based Architecture
* Full-Stack Development

---

## Outcome

SnapShareAI successfully automates the process of identifying people in group photos and delivering those photos to the correct recipients using Artificial Intelligence, Facial Recognition, FastAPI, MongoDB Atlas, and Email Automation.

The project showcases the integration of AI, Mobile Development, Backend Engineering, and Cloud Databases to solve a real-world photo-sharing problem.

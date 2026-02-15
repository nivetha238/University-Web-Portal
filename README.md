# University Web Portal — Hackathon Project

A full-stack university portal with **homepage**, **attendance marking**, **assignment submission with automated feedback**, **dashboard**, and **admin panel**.

## Features

- **University Home Page**: Logo, name, motto, navigation (Home, About Us, Courses, Student/Faculty Portal), featured events/news, footer with contact and social links. Responsive and modern UI.
- **Attendance System**: Faculty login, select class and date, mark each student Present/Absent, view attendance history, generate reports by date range. Database backend (file-based store).
- **Assignment Submission & Automated Feedback**: Students choose course/assignment, upload PDF/DOCX/TXT/images, submit and receive instant feedback (grammar, relevance, originality). Optional external API for evaluation.
- **Dashboard**: Single place for students and faculty to see assignments, attendance, and quick links.
- **Admin Panel**: View users, classes, and stats (attendance count, submissions).

## Tech Stack

- **Frontend**: React (Vite), React Router
- **Backend**: Node.js, Express
- **Database**: JSON file store (no DB install required)
- **Assignment evaluation**: Optional external API for instant feedback; works without it

## Setup

1. **Install dependencies**
   ```bash
   npm run install:all
   ```
   Or manually:
   ```bash
   npm install
   cd server && npm install
   cd ../client && npm install
   ```

2. **Configure server (optional)**
   - Copy `server/.env.example` to `server/.env` if you want to change port or JWT secret.
   - For **automated assignment feedback**, set the API key in `server/.env`. Without it, submissions still work with a message that automatic feedback is disabled.

3. **Run the app**
   ```bash
   npm run dev
   ```
   - Frontend: http://localhost:3000  
   - Backend API: http://localhost:4000  

   Or run separately:
   - `npm run server` (backend)
   - `npm run client` (frontend; proxy to backend for `/api` and `/uploads`)

## Demo Login

| Role   | Email                  | Password   |
|--------|------------------------|------------|
| Student| student@university.edu | student123 |
| Faculty| faculty@university.edu | faculty123 |
| Admin  | admin@university.edu   | admin123   |

## Project Structure

```
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/     # Layout, Navbar, Footer
│   │   ├── hooks/          # useAuth
│   │   └── pages/          # Home, Login, StudentPortal, FacultyPortal, Admin, Dashboard
│   └── vite.config.js
├── server/                 # Express backend
│   ├── index.js            # API routes, auth, attendance, assignments, admin
│   ├── db.js               # Data store and seed
│   ├── feedback-service.js # Assignment evaluation / instant feedback
│   └── uploads/            # Uploaded assignment files
└── package.json            # Root scripts (concurrently)
```

## API Overview

- `POST /api/auth/login` — Login (email, password)
- `GET /api/auth/me` — Current user (Bearer token)
- `GET /api/events` — Homepage events
- `GET /api/classes` — Classes (by role)
- `GET /api/classes/:id/students` — Students in class (faculty/admin)
- `POST /api/attendance` — Mark attendance (faculty/admin)
- `GET /api/attendance` — List attendance (query: classId, from, to)
- `GET /api/attendance/report` — Report by class and date range
- `GET /api/assignments` — Assignments list
- `POST /api/assignments/:id/submit` — Submit file (multipart), get feedback
- `GET /api/submissions` — Submissions list
- `GET /api/admin/*` — Admin stats, users, classes




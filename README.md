# Project: AI Army HQ (Gandiv Dhanush)

This is the central command center and API backend for a specialized, multi-agent AI system. This project is built on a "No Manual Work" philosophy, designed for tactical execution, automation, and data-driven analysis.

This system serves as the 'brain' for 15+ specialized AI agents (e.g., Gym Tracker AI, Horoscope AI, Project AI, Noson AI) and connects them to a persistent 'memory' (database) and various UIs.

---

## 🛠️ Tech Stack (The "Empire's" Tools)

| Component | Technology | Purpose (Kaam) |
| :--- | :--- | :--- |
| **Backend (API)** | **Python (FastAPI)** | The high-performance 'Brain' that manages all agent logic and API requests. |
| **Frontend (UI)** | **React.js (Vite)** | The 'Face' - a modern, fast chat interface for interacting with agents. |
| **Database (Memory)**| **MySQL** | The 'Memory' - persistent, structured storage for all agent data and user history. |
| **Server (Host)** | **Hostinger VPS (Ubuntu)** | The 'Fortress' - where the entire application is securely hosted and runs. |
| **Web Server** | **Nginx** | The 'Gatekeeper' - Manages all web traffic, serves the React app, and acts as a reverse proxy for the API. |
| **Process Manager**| **Gunicorn** | The 'Engine' - Runs the FastAPI application in a production environment. |
| **Service Manager**| **Supervisor** | The 'Guardian' - Ensures the Gunicorn process (our app) is always running, even if it crashes. |

---

## 🏛️ Architecture Blueprint

This project follows a decoupled, high-performance architecture:

1.  **User (UI)** interacts with the **React Frontend**.
2.  **React Frontend** sends API requests to **Nginx**.
3.  **Nginx** serves the React app's static files. For API calls (e.g., `/api/...`), it acts as a reverse proxy.
4.  **Nginx** forwards API requests to the **Gunicorn** process.
5.  **Gunicorn** runs the **FastAPI (Backend)** application.
6.  **FastAPI** receives the request, processes logic, and uses the **Agent Router** to select the correct AI agent.
7.  The **AI Agent** (e.g., 'Ankit Gym AI') reads/writes data to the **MySQL Database** (its 'Memory').
8.  The response flows back the same way to the user.

---

## 🗂️ Project Directory Structure

```
/ai-army-hq/
├── /backend/                 # FastAPI (The Brain)
│   ├── /app/
│   │   ├── /api/             # All API endpoints
│   │   │   ├── __init__.py
│   │   │   ├── agent_router.py
│   │   │   ├── agent_gym.py
│   │   │   ├── agent_horoscope.py
│   │   │   └── (...13 more agent files...)
│   │   ├── /core/            # Config, settings
│   │   │   └── config.py
│   │   ├── /db/              # Database models & session
│   │   │   ├── database.py
│   │   │   └── models.py
│   │   ├── __init__.py
│   │   └── main.py           # Main FastAPI app instance
│   ├── requirements.txt      # All Python dependencies
│   └── .env.example          # Environment variables template
│
├── /frontend/                # React.js (The Face)
│   ├── /public/
│   ├── /src/
│   │   ├── /components/      # Reusable UI parts (ChatBox, etc)
│   │   ├── /pages/           # Main pages (Dashboard, etc)
│   │   ├── /services/        # API calling logic
│   │   │   └── api.js
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
│
├── /deploy/                  # VPS Deployment Configs
│   ├── nginx.conf            # Nginx config file for proxy
│   └── supervisor.conf       # Supervisor config for Gunicorn
│
└── README.md                 # Your project documentation
```

---

## 🚀 Local Setup & Development (For Testing)

### 1. Backend (FastAPI)

```bash
# 1. Go to backend directory
cd backend

# 2. Create a virtual environment
python3 -m venv venv
source venv/bin/activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Set up your .env file (copy .env.example)
# Add your MySQL DB credentials here

# 5. Run the dev server
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

### 2. Frontend (React)

```bash
# 1. Go to frontend directory (in a new terminal)
cd frontend

# 2. Install dependencies
npm install

# 3. Run the dev server
npm run dev
```

### 3. Database (MySQL)

Ensure you have a local MySQL server running. Create the database (e.g., `ai_army_db`) and update your `.env` file in the `/backend/` directory with the connection details.

---

## 🌐 VPS Deployment (Hostinger)

This project is designed to be deployed on a Hostinger VPS (Ubuntu) using the "Empire Stack".

1. **Server Setup**: Configure the VPS with Nginx, Supervisor, Gunicorn, and MySQL server.
2. **Database**: Create the production MySQL database and user.
3. **Deploy Code**: Clone this repository to the VPS.
4. **Configure Nginx**: Use the `deploy/nginx.conf` file as a template to set up the reverse proxy.
5. **Configure Supervisor**: Use `deploy/supervisor.conf` to manage the Gunicorn process.
6. **Build Frontend**: Run `npm run build` in the `/frontend` directory. Configure Nginx to serve the static files from the `/frontend/dist` folder.
7. **Run Backend**: Supervisor will automatically start the gunicorn process.
8. **SSL**: Secure the domain with Let's Encrypt (Certbot).

---

## ✍️ Author

**Ankit Rajput***
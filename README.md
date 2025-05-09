# Dynamic Tourism Project

This repository contains a dynamic tourism project with a Django REST API backend and a Flutter web app frontend.

## Project Structure

```
├── apps/
│   ├── backend/                  # Django REST API
│   │   ├── my_api/              # Main Django app
│   │   ├── manage.py
│   │   ├── requirements.txt
│   │   └── my_project/          # Django project settings
│   ├── frontend/                 # Flutter Web App
│   │   ├── lib/
│   │   ├── web/
│   │   ├── pubspec.yaml
│   │   └── README.md
├── .gitignore
├── README.md
└── docker-compose.yml            # (Optional) for running both services
```

## Setting Up the Backend

1. Navigate to the `apps/backend` directory.
2. Create a virtual environment and activate it:
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```
3. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```
4. Apply the database migrations:
   ```
   python manage.py migrate
   ```
5. Run the development server:
   ```
   python manage.py runserver
   ```

## Setting Up the Frontend

1. Navigate to the `apps/frontend` directory.
2. Install the required dependencies:
   ```
   flutter pub get
   ```
3. Run the Flutter web app:
   ```
   flutter run -d chrome
   ```

## Running the Project Using Docker

1. Ensure you have Docker and Docker Compose installed.
2. Navigate to the root directory of the project.
3. Build and start the services:
   ```
   docker-compose up --build
   ```
4. Access the backend API at `http://localhost:8000` and the frontend app at `http://localhost:8080`.

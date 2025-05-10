# Dynamic Tourism Project

Dynamic Tourism Project is a modern web application designed to provide a seamless experience for users to explore, book, and manage travel and tourism services. The application features a responsive frontend developed using Flutter (Dart) and a robust backend built with Django. It includes key features such as destination filtering, tour booking, customer testimonials, and more.

---

## Features

### Backend API Endpoints
The backend exposes several RESTful API endpoints for managing and retrieving data:

- `/api/destinations/` - For destination listings and filtering.
- `/api/bookings/` - For managing tour bookings.
- `/api/blog/` - For blog articles.
- `/api/testimonials/` - For customer testimonials.
- `/api/guides/` - For retrieving information about tour guides.
- `/api/contact/` - For handling contact form submissions.

### Frontend Components
The frontend provides an interactive and user-friendly interface with the following components:

- **Header/Navigation**: Sticky navbar with mobile responsiveness.
- **Hero Section**: Carousel slider with a search form.
- **Destination Filtering**: Interactive filters to refine destination results.
- **Booking System**: Multi-step booking form for efficient tour reservations.
- **Gallery**: Image popup functionality for an enhanced visual experience.
- **Testimonials**: Carousel display for customer feedback.
- **Contact Page**: Integrated with Google Maps for easy navigation.

### Responsive Design
- **Breakpoints**:
  - Mobile: 320px
  - Tablet: 768px
  - Desktop: 1024px+
- **Layouts**:
  - Adaptive layouts using Flutter's `LayoutBuilder`.
  - Mobile-first CSS approach using Tailwind for consistent styling.

### SEO Optimization
- Semantic HTML structure in Flutter Web.
- Dynamic meta tags for each page.
- Sitemap generation for improved indexing.
- Lazy loading for images to enhance performance.

### Performance
- Image optimization pipeline for efficient delivery.
- Code splitting for faster page loads.
- API response caching to reduce server load.
- JWT token refresh mechanism for secure authentication.

### Pages
The application includes 13+ fully implemented pages:
- Home
- About
- Services
- Packages
- Destination
- Tour Categories
- Booking
- Gallery
- Guides
- Testimonials
- Blog
- Contact
- 404 Error
- Blog Detail Pages

---

## Setup Instructions

### Prerequisites
Before starting, ensure you have the following installed on your system:
- [Node.js](https://nodejs.org/) (for npm)
- [Python](https://www.python.org/) (Version 3.8+)
- [Docker](https://www.docker.com/)
- [Flutter](https://flutter.dev/) (for Dart development)

---

### Installation

#### Step 1: Clone the Repository
```bash
git clone https://github.com/sisovin/dynamic-tourism-project.git
cd dynamic-tourism-project
```

---

## How to Set Up Django (Backend)

1. **Navigate to the Backend Directory**:
   ```bash
   cd backend
   ```

2. **Create a Python Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate   # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Apply Database Migrations**:
   ```bash
   python manage.py migrate
   ```

5. **Run the Development Server**:
   ```bash
   python manage.py runserver
   ```

6. **Verify API Endpoints**:
   Open your browser or API testing tool (like Postman) and visit:
   - `http://127.0.0.1:8000/api/destinations/`
   - `http://127.0.0.1:8000/api/bookings/`

---

## How to Install Flutter (Frontend)

1. **Install Flutter**:
   Follow the official Flutter installation guide for your operating system: [Flutter Installation](https://flutter.dev/docs/get-started/install).

2. **Verify Flutter Installation**:
   Run the following command to check if Flutter is installed correctly:
   ```bash
   flutter doctor
   ```

3. **Navigate to the Frontend Directory**:
   ```bash
   cd frontend
   ```

4. **Fetch Dependencies**:
   Run the following command to install all required Flutter packages:
   ```bash
   flutter pub get
   ```

5. **Run the Flutter Web Application**:
   ```bash
   flutter run -d web
   ```
   The application should now be accessible at `http://localhost:8080`.

6. **Build for Production**:
   To build the Flutter app for production, use:
   ```bash
   flutter build web
   ```

---

## Running the Application

### Backend
1. Ensure the PostgreSQL database is running:
   ```bash
   docker-compose up -d
   ```

2. Start the Django backend server:
   ```bash
   python manage.py runserver
   ```

### Frontend
1. Start the Flutter development server:
   ```bash
   flutter run -d web
   ```

2. Access the application in your browser at `http://localhost:8080`.

---

## Setting Up Redis and Sentry

### Redis
1. **Ensure Redis is running**:
   ```bash
   docker-compose up -d redis
   ```

2. **Configure Redis in Django settings**:
   Add the following to your `settings.py`:
   ```python
   CACHES = {
       'default': {
           'BACKEND': 'django_redis.cache.RedisCache',
           'LOCATION': f"redis://{os.getenv('REDIS_HOST', 'localhost')}:{os.getenv('REDIS_PORT', '6379')}/1",
           'OPTIONS': {
               'CLIENT_CLASS': 'django_redis.client.DefaultClient',
           }
       }
   }
   ```

### Sentry
1. **Set up Sentry DSN and Environment**:
   Add the following to your `.env` file:
   ```env
   SENTRY_DSN=your_sentry_dsn
   SENTRY_ENVIRONMENT=your_sentry_environment
   ```

2. **Initialize Sentry in your application**:
   For Django, add the following to your `settings.py`:
   ```python
   import sentry_sdk
   from sentry_sdk.integrations.django import DjangoIntegration

   sentry_sdk.init(
       dsn=os.getenv('SENTRY_DSN'),
       integrations=[DjangoIntegration()],
       environment=os.getenv('SENTRY_ENVIRONMENT'),
   )
   ```

   For Flutter, add the following to your `main.dart`:
   ```dart
   import 'package:sentry_flutter/sentry_flutter.dart';

   void main() async {
     await SentryFlutter.init(
       (options) {
         options.dsn = 'YOUR_SENTRY_DSN';
         options.environment = 'YOUR_SENTRY_ENVIRONMENT';
       },
       appRunner: () => runApp(MyApp()),
     );
   }
   ```

---

## Contributing Guidelines

We welcome contributions to the Dynamic Tourism Project! To contribute, please follow these guidelines:

1. **Fork the Repository**: Create your own copy of the repository.
2. **Create a Branch**: Work on a new branch for your feature or bugfix.
3. **Write Clear Commit Messages**: Ensure your commits are descriptive and meaningful.
4. **Follow Coding Standards**: Adhere to the project's coding guidelines.
5. **Submit a Pull Request**: Open a pull request with a detailed explanation of your changes.

Thank you for contributing to the project!

---

## License

This project is licensed under the [MIT License](LICENSE).

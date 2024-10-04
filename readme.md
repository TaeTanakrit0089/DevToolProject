## Devtool System

This repository contains the source code for a developer tool system.

### Development Setup

#### Prerequisites

- Python 3.10+
- Node.js 16+
- PostgreSQL 14+

#### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/devtool-system.git
   cd devtool-system
   ```

2. **Navigate to the backend directory:**

   ```bash
   cd devtool_system
   ```

3. **Create a virtual environment (recommended):**

   ```bash
   python -m venv .venv
   source .venv/bin/activate
   ```

4. **Install Python dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

5. **Create a PostgreSQL database and user:**
    - Ensure PostgreSQL is installed and running.
    - Create a database named `app_db`.
    - Create a user named `postgres` with password `password` and grant access to the `app_db` database.

6. **Create a `.env` file:**

   ```bash
   vim .env
   ```

7. **Add environment variables to `.env`:**

   ```
   DB_NAME=app_db
   DB_USER=postgres
   DB_PASSWORD=password
   DB_HOST=localhost
   DB_PORT=5432
   ```

8. **Apply migrations:**

   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

9. **Start the Django development server:**

   ```bash
   python manage.py runserver
   ```

10. **Open a new terminal and navigate to the frontend directory:**

```bash
cd ../frontend
```

11. **Install Node.js dependencies:**

```bash
npm install
```

12. **Start the Tailwind development server:**

```bash
npm run start
```

The application should now be accessible at `http://localhost:8000/` in your browser.

### Jenkins Build

The following Jenkins pipeline can be used to build and deploy the application:

```groovy
pipeline {
  agent any

  stages {
    stage('Pull Code') {
      steps {
        git url: 'https://github.com/your-username/devtool-system.git'
      }
    }

    stage('Build and Run') {
      steps {
        sh 'docker compose down'
        sh 'docker compose up --build'
      }
    }
  }
}
```

This pipeline performs the following steps:

1. **Pull Code:** Clones the latest code from the repository.
2. **Build and Run:** Stops any existing Docker containers, builds new containers, and starts the application.

**Note:** Ensure that Docker is installed and configured on the Jenkins server.

test test
test2

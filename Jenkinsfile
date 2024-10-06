pipeline {
    agent any
    environment {
        DB_NAME = 'app_db'
        DB_USER = 'postgres'
        DB_PASSWORD = 'Ab123456*'
        DB_HOST = 'postgres_db'
        DB_PORT = '5432'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Attempting to checkout repository'
                git url: 'https://github.com/TaeTanakrit0089/DevToolProject.git',
                    branch: 'main',
                    credentialsId: 'github'
            }
        }

        stage('Create .env File') {
            steps {
                script {
                    // Create a .env file with the environment variables
                    sh '''
                        echo "DB_NAME=${DB_NAME}" > .env
                        echo "DB_USER=${DB_USER}" >> .env
                        echo "DB_PASSWORD=${DB_PASSWORD}" >> .env
                        echo "DB_HOST=${DB_HOST}" >> .env
                        echo "DB_PORT=${DB_PORT}" >> .env
                    '''
                    echo '.env file created with database credentials.'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    // Build the Docker images defined in the Dockerfile
                    sh 'docker compose build'
                }
            }
        }

        stage('Run Docker Containers') {
            steps {
                script {
                    // Run the containers
                    sh 'docker compose up -d' // Run in detached mode
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully! The repository was checked out, and Docker containers were built and run.'
        }
        failure {
            echo 'Pipeline execution failed. Please check the logs for details.'
        }
        always {
            echo 'Pipeline execution completed. This message appears regardless of the outcome.'
        }
    }
}

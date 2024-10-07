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
                    writeFile file: '.env', text: """
                        DB_NAME=${DB_NAME}
                        DB_USER=${DB_USER}
                        DB_PASSWORD=${DB_PASSWORD}
                        DB_HOST=${DB_HOST}
                        DB_PORT=${DB_PORT}
                    """
                    echo '.env file created with database credentials.'
                }
            }
        }

        stage('Build and Run Docker Containers') {
            parallel {
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

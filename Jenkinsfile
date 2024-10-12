pipeline {
    agent any
    environment {
        DB_NAME = 'app_db'
        DB_USER = 'postgres'
        DB_PASSWORD = 'Ab123456*'
        DB_HOST = 'postgres_db'
        DB_PORT = '5432'
        PRODUCTION=1
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out repository...'
                git url: 'https://github.com/TaeTanakrit0089/DevToolProject.git',
                    branch: 'main',
                    credentialsId: 'github'
            }
        }

        stage('Create .env File') {
            steps {
                script {
                    sh '''
                        cat <<EOF > .env
                        DB_NAME=${DB_NAME}
                        DB_USER=${DB_USER}
                        DB_PASSWORD=${DB_PASSWORD}
                        DB_HOST=${DB_HOST}
                        DB_PORT=${DB_PORT}
                        PRODUCTION=${PRODUCTION}
                        EOF
                    '''
                    echo '.env file created.'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    sh 'docker compose build'
                }
            }
        }

        stage('Run Docker Containers') {
            steps {
                script {
                    sh 'docker compose up'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed.'
        }
        always {
            echo 'Pipeline execution completed.'
        }
    }
}

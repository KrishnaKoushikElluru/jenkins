pipeline {
    agent any
    environment{
        DOCKER = '"C:/Program Files/Docker/Docker/resources/bin/docker.exe"'
    }

    stages {

        stage('Checkout Local Git') {
            steps {
                git url: 'https://github.com/KrishnaKoushikElluru/jenkins.git', branch: 'koushik'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    try {
                        bat 'docker build -t python-app .'
                    } catch (err) {
                        echo 'Docker build failed'
                        currentBuild.result = 'FAILURE'
                        error 'Stopping pipeline'
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                retry(2) {
                    bat 'docker run -d -p 8085:80 python-app'
                }
            }
        }

    }

    post {
        failure {
            bat 'docker system prune -f'
        }
    }
}
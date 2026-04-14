pipeline {
    agent any
    environment{
        DOCKER = '"C:/Program Files/Docker/Docker/resources/bin/docker.exe"'
    }

    stages{
        stage('checkout git'){
            steps{
                script{
                    try{
                        git url: 'https://github.com/KrishnaKoushikElluru/jenkins.git', branch: 'koushik'
                    }catch(e){
                        echo 'Git checkout failed'
                        currentBuild.result = 'FAILURE'
                        error 'Stopping pipeline'
                    }
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    try{
                        bat 'docker build -t html-app .'
                    }catch(e){
                        echo "build failed"
                        currentBuild.result='FAILURE'
                        error 'stopping pipeline'
                    }

                }
            }
        }
        stage('run container'){
            steps{
                bat 'docker run -d -p 8085:8080 html-app'
            }
        }
    }

    post{
        failure{
            bat 'docker system prune -f'
        }
    }


}
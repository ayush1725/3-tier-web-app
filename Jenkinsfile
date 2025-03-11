@Library('Shared')_
pipeline{
    
    agent { label "vinod" }
    
    stages{
        
        stage("Code"){
            steps {
                echo "This is Clonning the code"
                git url: "https://github.com/ayush1725/3-tier-web-app.git", branch:"main"
                echo "Code Clonned Successfully"
            }
        }
        stage("Build"){
            steps {
                echo "This is building the code"
                sh "whoami"
                sh "docker build -t notes-app:latest ."
            }
        }
        stage("Test"){
            steps {
                echo "This is testing the code"
            }
        }
        stage("Deploy"){
           steps {
               echo "This is Deploying the code"
               sh "docker run -d -p 8000:8000 notes-app:latest"
           } 
        }
    }
}

pipeline {
    agent any
      options {
            buildDiscarder(logRotator(numToKeepStr: '7'))
             }
    
    
     stages {
         stage('Sonarqube') {
           environment {
                scannerHome = tool 'sonar-scanner'
                }
         steps {
            withSonarQubeEnv('sonarqube') {
               sh "${scannerHome}/bin/sonar-scanner"
            }
            timeout(time: 5, unit: 'MINUTES') {
               waitForQualityGate abortPipeline: true
               }
            }
         }
         
         
     stage('sonarqube'){
        steps {
          sh ''' #! /bin/bash
          echo Sonarqube complete
          '''
          }  
      }
         
     stage('Deploy') { 
           steps {
             sh ''' #! /bin/bash 
             
             aws deploy create-deployment --application-name sonartest --deployment-group-name sonartest-dg --deployment-config-name CodeDeployDefault.AllAtOnce --github-location repository=https://github.com/1996Shubh/Chatapp_project,commitId=${GIT_COMMIT}
             '''
            }
        }
        
     stage('status'){
            steps {
            sh ''' #! /bin/bash
            echo Deployment started
            '''
            }  
        }
        
    }
    post { 
        always { 
            echo 'Stage is success'
        }
    }
    
    
}

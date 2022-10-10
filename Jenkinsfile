pipeline{
    agent any
    environment{
               dockerhub=credentials('dockerhub')
}
    tools{
        maven 'M2'
    }
    stages{
        stage('clone'){
            steps{
                git credentialsId: 'gitlab', url: 'git@gitlab.com:samiibnbougatef/devops-example.git'
            }
        }
         stage('build'){
        steps{
             sh 'mvn clean install package '
         }
     }
     stage("docker image"){
         steps{
                sh 'cp -r /var/lib/jenkins/workspace/projet10/target/ /home/ansadmin/projet10/'
                sh 'docker build -t samiibnbougatef/springboot:${BUILD_NUMBER} /home/ansadmin/projet10/.'
                sh ' docker login -u $dockerhub_USR -p $dockerhub_PSW '  
                sh ' docker push samiibnbougatef/springboot:${BUILD_NUMBER} ' 
         }
     }
     stage('deploy the image'){
         steps{
            kubernetesDeploy configs: 'deployment.yml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://'] 
            kubernetesDeploy configs: 'grafana.yml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://'] 
            kubernetesDeploy configs: 'prometheus.yml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://'] 
         }
     }
    }
}

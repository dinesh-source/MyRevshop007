pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:$PATH" 
        DOCKER_CREDENTIALS = 'Docker_cred'  // Add this in Jenkins credentials
        KUBECONFIG_CRED_ID = 'k8s-kubeconfig'

    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/dinesh-source/MyRevshop007.git'
            }
        }

        stage('Build Jar') {
            steps {
                sh 'echo "Using Maven version:"'
                sh 'mvn --version'  // Check if Maven is accessible
                sh 'mvn clean'  // Removes old build files
                sh 'mvn package -DskipTests' 
            }
        }
        stage('Building the Docker image'){
            steps{
                sh 'docker build -t singuluridinesh007/revshop:v2 .'
            }
        }
        stage('Login into the Docker Hub'){
            steps{
                withCredentials([string(credentialsId: "$DOCKER_CREDENTIALS", variable: "DOCKER_PASSWORD")]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u singuluridinesh007 --password-stdin'
                }
            }
        }
        stage('Push it to the docker hub'){
            steps{
                sh 'docker push singuluridinesh007/revshop:v2'

            }
        }
        
        stage('Setup Kubernetes Config') {
            steps {
                script {
                    withCredentials([file(credentialsId: KUBECONFIG_CRED_ID, variable: 'KUBECONFIG_FILE')]) {
                        sh '''
                        kubectl config current-context
                        '''
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    cd k8s  # Move inside the k8s folder
                    kubectl apply -f . --namespace=revshop  # Apply all YAML files in the specified namespace
                    kubectl get pods -n revshop # List pods in your namespace
                    '''
                }
            }
        }
    }
}

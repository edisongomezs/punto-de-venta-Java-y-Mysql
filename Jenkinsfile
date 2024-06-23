pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Usar Maven para construir el proyecto
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'docker-compose up -d'
                sh 'docker exec -it puntoventa mvn test'
                sh 'docker-compose down'
            }
        }
        stage('Create Docker Image and Push to Docker Hub') {
            steps {
                ansiblePlaybook(
                    playbook: 'ansible/create_image_puntoventa.yml',
                    inventory: 'ansible/hosts'
                )
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                ansiblePlaybook(
                    playbook: 'ansible/kube_deploy_puntoventa.yml',
                    inventory: 'ansible/hosts'
                )
            }
        }
    }
}

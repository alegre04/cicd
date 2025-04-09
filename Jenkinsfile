pipeline {
    agent any
    environment {
        OPENSHIFT_PROJECT = 'integracion'
    }
    stages {
        stage('Clonar') {
            steps {
                git url: 'https://github.com/alegre04/cicd.git', branch: 'main'
            }
        }
        stage('Compilar imagen') {
            steps {
                script {
                    openshift.withCluster() {
                        openshift.withProject(OPENSHIFT_PROJECT) {
                            openshift.selector("bc", "cicd").startBuild("--wait=true")
                        }
                    }
                }
            }
        }
        stage('Desplegar') {
            steps {
                script {
                    openshift.withCluster() {
                        openshift.withProject(OPENSHIFT_PROJECT) {
                            openshift.selector("dc", "cicd").rollout().latest()
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completado con éxito!'
        }
        failure {
            echo 'Pipeline falló. Verifique los logs para más detalles.'
        }
    }
}

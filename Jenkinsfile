pipeline {
    agent any
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
                        openshift.withProject('integracion') {
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
                        openshift.withProject('integracion') {
                            openshift.selector("dc", "cicd").rollout().latest()
                        }
                    }
                }
            }
        }
    }
}

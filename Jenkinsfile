def notify(String status) {
    status = status ?: 'SUCCESS'
    def colorCode = status == 'SUCCESS' ? '#00FF00' : '#FF0000'
    def summary = """*${status}*: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':\nMore detail in console output at <${env.BUILD_URL}|${env.BUILD_URL}>"""

}

node('cm-slave') {
    def app
    try {
        deleteDir()
        stage('Checkout') {
            checkout scm
        }
        
        
        stage('Deploy Preint') {
            sh "curl -v http://${JENKINS_USER}:${JENKINS_API_TOKEN}@jenkins.mgmt.cwds.io:8080/job/preint/job/deploy-case-mng/buildWithParameters?token=${JENKINS_TRIGGER_TOKEN}&cause=Caused%20by%20Build%20${env.BUILD_ID}"
        }
        
    } catch(Exception e) {
       currentBuild.result = "FAILURE"
       throw e
    } 
}

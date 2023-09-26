pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                sh "ls -lat"
                echo "done checkout"
                echo params.BuildId
            }
        }
		stage('Run Tests') {
           steps {
				echo "Setup and run API Tests"
				sh('bash ./jenkinsscript.sh')
          }
        }
	// stage("publish junit report") {
    //         steps{
    //             echo "publishing junit"
    //             junit skipMarkingBuildUnstable: true, testResults: 'xmlReport/output.xml'
    //         }
    //     }
        stage("Publish Allure Report")	{
            steps{
                echo "Publish Allure"
                allure includeProperties: false, jdk: '', results: [[path: 'testline/target/allure-results']]
            }
        }

    }
}

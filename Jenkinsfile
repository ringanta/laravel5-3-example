node('aws') {
   stage('Preparation') { 
      checkout scm
   }

   stage('Commit') {
      sh './build.sh ./gradlew commit'
      archiveArtifacts 'build/dist/laravel5.zip'
   }

   stage('Automated Acceptance Test') {
      sh './build.sh ./gradlew acceptanceTests'
      
      step([$class: 'CheckStylePublisher', defaultEncoding: '', healthy: '', pattern: 'build/logs/phpcs.xml', unHealthy: '', useDeltaValues: true])
      step([$class: 'PmdPublisher', defaultEncoding: '', healthy: '', pattern: 'build/logs/phpmd.xml', unHealthy: ''])
      step([$class: 'DryPublisher', defaultEncoding: '', healthy: '', highThreshold: 20, normalThreshold: 10, pattern: 'build/logs/phpcpd.xml', unHealthy: ''])
      step([$class: 'AnalysisPublisher', defaultEncoding: '', healthy: '', unHealthy: ''])
   }
   
   stage('Manual Validation') {
      build job: 'Deployment Staging', parameters: [string(name: 'SOURCE_BUILD_NO', value: "${env.BUILD_NUMBER}")], wait: false
   }
}

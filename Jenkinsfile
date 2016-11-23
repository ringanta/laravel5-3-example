node('aws') {
   stage('Preparation') { 
      checkout
   }

   stage('Commit') {
      sh './build.sh ./gradlew commit'
      archiveArtifacts 'build/dist/laravel5.zip'
   }

   stage('Automated Acceptance Test') {
      sh './build.sh ./gradlew acceptanceTests'
      
      step([$class: 'CheckStylePublisher', defaultEncoding: '', healthy: '', pattern: 'build/logs/checkstyle.xml', unHealthy: '', useDeltaValues: true])
      step([$class: 'PmdPublisher', defaultEncoding: '', healthy: '', pattern: 'build/logs/pmd.xml', unHealthy: ''])
      step([$class: 'DryPublisher', defaultEncoding: '', healthy: '', highThreshold: 20, normalThreshold: 10, pattern: 'build/logs/pmd-cpd.xml', unHealthy: ''])
      step([$class: 'AnalysisPublisher', defaultEncoding: '', healthy: '', unHealthy: ''])

   }
}

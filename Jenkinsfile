pipeline {
  agent {
    docker {
      image 'warsiviews123/java23-maven3.9.6'
      args '-u root:root'  // So docker can write files as root user if needed
    }
  }

  tools {
    maven 'Maven_3_6_3'
  }

  environment {
    SONAR_TOKEN = credentials('SONAR_TOKEN')
  }

  stages {
    stage('Clone WebGoat') {
      steps {
        git url: 'https://github.com/WebGoat/WebGoat.git', branch: 'main'
      }
    }

    stage('SonarQube SAST Analysis') {
      steps {
        sh '''
          mvn clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar \
            -Dsonar.projectKey=webgoat-devsec \
            -Dsonar.host.url=http://172.203.135.72:9000 \
            -Dsonar.login=${SONAR_TOKEN}
        '''
      }
    }
  }
}

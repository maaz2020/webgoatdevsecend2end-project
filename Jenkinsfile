pipeline {
  agent any
  environment {
    SONAR_TOKEN = credentials('SONAR_TOKEN')
  }

  stages {
    stage('Build with JDK 23') {
      agent {
        docker {
          image 'warsiviews123/java23-maven3.9.6'
          args '-u root:root'
        }
      }
      steps {
        git url: 'https://github.com/WebGoat/WebGoat.git', branch: 'main'
        sh 'mvn clean verify -DskipTests'
      }
    }

    stage('SonarQube SAST with Java 17') {
      agent {
        docker {
          image 'maven:3.9.6-eclipse-temurin-17'
          args '-u root:root'
        }
      }
      steps {
        sh '''
          mvn verify -DskipTests \
            org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar \
            -Dsonar.projectKey=webgoat-devsec \
            -Dsonar.host.url=http://172.203.135.72:9000 \
            -Dsonar.login=${SONAR_TOKEN}
        '''
      }
    }
  }
}

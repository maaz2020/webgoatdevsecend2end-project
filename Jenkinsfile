pipeline {
  agent {
    docker {
      image 'warsiviews123/java23-maven3.9.6' // Java 23 + Maven 3.9.6
      args '-u root:root'  // Ensures file permissions
    }
  }

  environment {
    SONAR_TOKEN = credentials('SONAR_TOKEN') // SonarQube auth token
  }

  stages {
    stage('Checkout WebGoat') {
      steps {
        git url: 'https://github.com/WebGoat/WebGoat.git', branch: 'main'
      }
    }

    stage('SAST Scan with SonarQube') {
      steps {
        sh '''
          # Skip tests & run SonarQube scan
          mvn clean install -DskipTests \
            sonar:sonar \
            -Dsonar.projectKey=webgoat-devsec \
            -Dsonar.host.url=http://172.203.135.72:9000 \
            -Dsonar.login=${SONAR_TOKEN} \
            -Dsonar.java.jdkHome=/usr/lib/jvm/java-23-oracle
        '''
      }
    }
  }
}

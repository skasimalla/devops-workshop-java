pipeline {

    agent any

    stages {

        stage('Test') {
                   
                    steps {

                    sh returnStdout: true, script: '''
                        mvn test -Dcheckstyle.skip 
                    ''' 
                }
        }

        stage('Build') {
            steps {
                echo 'Building..'

                //Get it from some git tag/ or some other dynamic mechanism
                sh (returnStdout: true, script: '''

                mkdir -p build
                cd build

                git clone https://github.com/spring-projects/spring-petclinic

                cd spring-petclinic

                version=$(git describe --tags `git rev-list --tags --max-count=1`)
                echo $version
               
                #needs some awk/ sed/ cut if it's major.minor, so keeping it simple
                version=$((version+1))  

                version=1
                echo $version

                mvn package -Dcheckstyle.skip -DskipTests
                #$version
                docker build -t skasimalla/image-pet:$version .
                docker push skasimalla/image-pet:$version
                
                #git tag $version -a
                #git push origin $version

                ''')
                //mvn spring-boot:build-image
            }
        }

        stage('Deploy') {
            steps {
                
                echo 'Deploying....'
                //docker -H "ssh://ec2-user@$REMOTE_HOST" run -p 8080:8080 --name pet-demo image-pet
                sh (returnStdout: true, script: '''
                docker stop pet-container || true && docker rm pet-container || true
                version=$(git describe --tags `git rev-list --tags --max-count=1`)
                version=1
                docker run -d -p 8080:8080 --name pet-container skasimalla/image-pet:$version
                ''')
            }
        }


    }
}
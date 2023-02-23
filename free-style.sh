if cd spring-petclinic; then git pull; else git clone https://github.com/spring-projects/spring-petclinic && cd spring-petclinic; fi
#git clone https://github.com/spring-projects/spring-petclinic

#version=$(git describe --tags `git rev-list --tags --max-count=1`)
#echo $version
               
#needs some awk/ sed/ cut if it's major.minor, so keeping it simple
#version=$((version+1))  
version=1
echo $version
mvn package -Dcheckstyle.skip -DskipTests
#$version

cp ../Dockerfile .
docker build -t skasimalla/image-pet:$version .
docker push skasimalla/image-pet:$version

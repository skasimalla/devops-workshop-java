# Devops Notes

## Task - Build a pipeline live coding session with Sam Kasimalla

    1. Use Spring pet-clinic (https://github.com/spring-projects/spring-petclinic) as your
    project source code
    2. Build a Jenkins pipeline with the following steps:
    a. Compile the code
    b. Run the tests
    c. Package the project as a runnable Docker image



    Wrote some terraform to create a machine to host this
    Please check the terraform folder

    For using Jcenter() instead of mavenCentral()
    I made changes to gradle based on this
    https://maven.apache.org/guides/mini/guide-multiple-repositories.html
    Since I'm using only maven, we are directly updating settings.xml in the ~/.mvn folder

    One of the ways to do it
    ```mvn -s settings.xml compile```
    Please check settings.xml

Please check the Jenkinsfile for end to end working script

### Other tricks I had to do on the EC2
    Create the docker group.
    Add the user to the docker group.
    Log out and log back in to ensure docker runs with correct permissions.
    Start docker.

    ``` sudo groupadd docker 
        sudo usermod -aG docker $(whoami)
        sudo service docker start
    ```


    Docker runnable image:
    ```docker run -d -p 8080:8080 --name pet-container skasimalla/image-pet:0.1```

    Deck draft: 
    https://docs.google.com/presentation/d/1nwaNwoqTaMloGO3ZBuQsd8ypTq7B1c8nTuFEGTWONew/edit#slide=id.g5d5952b667_0_0
    
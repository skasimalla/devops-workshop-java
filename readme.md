# Build a devops pipeline, live coding session with Sam Kasimalla

    ##Prerequisites
    Install aws cli
    Install terraform

    1. We'll use Spring pet-clinic (https://github.com/spring-projects/spring-petclinic) as your
    project source code
    2. Build a Jenkins pipeline with the following steps:
        a. Compile the code
        b. Run the tests
        c. Package the project as a runnable Docker image

    Wrote some terraform to create a machine to host this, please check the terraform folder

    Step 1: 
    Go to ~/.aws/config and add this 
    [lab1]
    region = us-east-1

    Go to ~/.aws/credentials and add this 
    [lab1]
    aws_access_key_id = <Get from IAM>
    aws_secret_access_key = <Get from IAM>

    aws ec2 create-key-pair --key-name sam-lab1 --profile=lab1 --region=us-east-1 --query 'KeyMaterial' --output text > ~/Downloads/sam-lab1.pem
    chmod 700 ~/Downloads/sam-lab1.pem

    cd terraform
    terraform init
    terraform plan
    terraform apply


    Go to Edit Inbound rules and add a rule
    It can be automated by using this, but I think this documentation has a mistake
    https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.create-cluster.cli.configure-inbound-rules.html

   ssh -i ~/Downloads/sam-lab1.pem ec2-user@34.230.37.250

    Run the script, this could have been ansible / user data - but wanted to go through it line by line

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
    

    Other notes: 
    If Jcenter() instead of mavenCentral()
    Changes to gradle based on this
    https://maven.apache.org/guides/mini/guide-multiple-repositories.html
    Since I'm using only maven, we can directly updating settings.xml in the ~/.mvn folder

    One of the ways to do it
    ```mvn -s settings.xml compile```
    Please check settings.xml

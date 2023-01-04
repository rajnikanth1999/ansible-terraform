pipeline {
    agent any
    triggers { pollSCM('* * * * *') }
    stages {
        stage('Source Code') {
            steps {
                git url: 'https://github.com/rajnikanth1999/ansible-terraform.git', 
                branch: 'master'
            }
        }
        stage('Terraform install') {
            steps {
                sh '''sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
                    wget -O- https://apt.releases.hashicorp.com/gpg | \\
                        gpg --dearmor | \\
                        sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
                    gpg --no-default-keyring \\
                        --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \\
                        --fingerprint
                    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \\
                        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \\
                        sudo tee /etc/apt/sources.list.d/hashicorp.list
                    sudo apt update
                    sudo apt-get install terraform'''
            }
        }
        stage('Terraform apply') {
            steps {
                sh '''
                    terraform init
                    terraform validate
                    terraform apply -auto-approve -var="web_pass=Password@1234" -var="trigger=${BUILD_NUMBER}"
                '''
            }
        }
    }
}
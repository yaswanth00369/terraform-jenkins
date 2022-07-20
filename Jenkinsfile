pipeline{
    agent any
    environment { PATH = "${PATH}:${getTerraformPath()}" }
    stages{
        stage("Terraform Init & Apply - Dev Env"){
            steps{
                sh "terraform init"
                sh returnStatus: true, script: 'terraform workspace new Development'
                sh "terraform workspace select Development"
                sh "terraform apply -var-file=dev.tfvars --auto-approve"
            }
        }
    
        stage("Terraform Init & Apply - Prod Env"){
            steps{
                sh "terraform init"
                sh returnStatus: true, script: 'terraform workspace new Production'
                sh "terraform workspace select Production"
                sh "terraform apply -var-file=prod.tfvars --auto-approve"
            }
        }   
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform1.2.2', type: 'terraform'
    return tfHome
}

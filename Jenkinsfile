pipeline{
    agent any
    environment { PATH = "${PATH}:${getTerraformPath()}" }
    stages{
        stage("Terraform Init & Apply - Dev Env"){
            steps{
                sh "terraform init"
                sh returnStatus: true, script: 'terraform workspace new Development'
                sh "terraform destroy -var-file=dev.tfvars --auto-approve"
            }
        }   
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform1.2.2', type: 'terraform'
    return tfHome
}

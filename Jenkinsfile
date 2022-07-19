pipeline{
    agent any
    environment { PATH = "${PATH}:${getTerraformPath()}" }
    stages{
        stage("Terraform Init & Apply - Development Env"){
            steps{
                sh "terraform init"
                sh "terraform workspace new development"
                sh "terraform apply -file-vars=dev.tfvars --auto-approve"

            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform1.2.2', type: 'terraform'
    return tfHome
}
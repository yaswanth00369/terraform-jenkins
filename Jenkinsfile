pipeline{
    agent any
    environment { PATH = "${PATH}:${getTerraformPath()}" }

    stages{

        stage("Create S3 Bucket"){
            steps{
                createS3Bucket('jenkins-tfstate-bucket')
            }
        }

        stage("Create DynamoDB Table"){
            steps{
                createDynamoDBTable()
            }
        }

        stage("Terraform Init & Apply/Destroy - Default Env"){
            steps{
                sh "terraform init"
                sh "terraform workspace select default"
                sh "terraform destroy -var-file=default.tfvars --auto-approve"
            }
        }

        stage("Terraform Init & Apply/Destroy - Dev Env"){
            steps{
                sh "terraform init"
                sh returnStatus: true, script: 'terraform workspace new Development'
                sh "terraform workspace select Development"
                sh "terraform destroy -var-file=dev.tfvars --auto-approve"
            }
        }
    
        stage("Terraform Init & Apply/Destroy - Prod Env"){
            steps{
                sh "terraform init "
                sh returnStatus: true, script: 'terraform workspace new Production'
                sh "terraform workspace select Production"
                sh "terraform destroy -var-file=prod.tfvars --auto-approve"
            }
        }   
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform1.2.2', type: 'terraform'
    return tfHome
}

def createS3Bucket(bucketName){
    sh returnStatus: true, script: " aws s3api create-bucket --bucket ${bucketName} --region us-east-1"
    sh returnStatus: true, script: " aws s3api put-bucket-versioning --bucket ${bucketName} --versioning-configuration Status=Enabled --region us-east-1"
}

def createDynamoDBTable(){
    sh returnStatus: true, script: "aws dynamodb create-table --cli-input-json file://create-Ddb-table.json --region us-east-1"
}


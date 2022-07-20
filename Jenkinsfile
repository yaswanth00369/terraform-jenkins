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

def createS3Bucket(bucketName){
    // sh returnStatus: true, script: " aws s3 mb s3://${bucketName} --region us-east-1"
    sh returnStatus: true, script: " aws s3api put-bucket-versioning --bucket ${bucketName} --versioning-configuration Status=Enabled --region us-east-1"
}

def createDynamoDBTable(){
    sh returnStatus: true, script: "aws dynamodb create-table --cli-input-json file://create-ddb-table.json --region us-east-1"
}


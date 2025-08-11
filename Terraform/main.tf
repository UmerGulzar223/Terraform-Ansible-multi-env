module "Dev-Infra" {
    source = "./AWS-infra"
    env="dev"
    bucketName="aws-infra-bucket"
    instance_type = "t2.micro"
    ami_id = "ami-0f918f7e67a3323f0"
    instance_count = 1
    volume_size = 15
    volume_type = "gp3"
}

module "stg-Infra" {
    source = "./AWS-infra"
    env="stg"
    bucketName="aws-infra-bucket"
    instance_type = "t2.micro"
    ami_id = "ami-0f918f7e67a3323f0"
    instance_count = 1
    volume_size = 10
    volume_type = "gp3"
}


module "Prod-Infra" {
    source = "./AWS-infra"
    env="prod"
    bucketName="aws-infra-bucket"
    instance_type = "t2.micro"
    ami_id = "ami-0f918f7e67a3323f0"
    instance_count = 2
    volume_size = 10
    volume_type = "gp3"
}


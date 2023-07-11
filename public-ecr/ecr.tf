
terraform {
  backend "s3" {
    bucket = "example-projects-terraform-remote-state"
    key    = "public-ecr.tfstate"
    region = "us-east-1"
  }
}

resource "aws_ecrpublic_repository" "deployer_samples" {
  provider = aws.us_east_1

  repository_name = "aws-ecs-cloudreactor-deployer-samples"

  catalog_data {
    about_text        = "Sample Docker Images built and pushed by AWS ECS CloudReactor Deployer"
    architectures     = ["x86", "x86-64"]
    description       = "Sample Docker Images built and pushed by AWS ECS CloudReactor Deployer"
    operating_systems = ["Linux"]
    usage_text        = "See [aws-ecs-cloudreactor-deployer](https://github.com/CloudReactor/aws-ecs-cloudreactor-deployer) for instructions on how to use this image to build and deploy to AWS ECS."
  }
}

resource "aws_iam_user" "image_publisher" {
  name = "image_publisher"
}

resource "aws_iam_access_key" "image_publisher" {
  user = aws_iam_user.image_publisher.name
}

resource "aws_iam_user_policy_attachment" "image_publisher_policy_attachment" {
  user       = aws_iam_user.image_publisher.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicPowerUser"
}

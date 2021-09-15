# CloudReactor Example Projects Infrastructure -- Terraform

This project uses Terraform to setup roles and infrastructure for the
CloudReactor example projects, such as the
[python quickstart](https://github.com/CloudReactor/cloudreactor-python-ecs-quickstart).

Requirements:
* Terraform 1.0.0+

## Setup

Use [tfenv](https://github.com/tfutils/tfenv) to install Terraform:

    tfenv install 1.0.6

In the AWS Management console, create an S3 bucket in the region that you
want to run your tasks, that will be used to store the Terraform state.
In this project, we are using the name
`example-projects-terraform-remote-state` but you can change that in
`init.tf`.

## Usage

In each sub-directory, select the correct version of Terraform:

    tfenv use

Next, initialize the Terraform state:

    terraform init

Then for each environment, create a workspace:

    terraform workspace new <environment>

Plan the changes:

    terraform plan -out plan.out

Then apply them:

    terraform apply plan.out

## What's created

So far, the only created entity is a role that can be assumed by ECS and
has access to Secrets Manager. In the future, we'll add a Target Group
and Elastic Load Balancer to be used with a web service.

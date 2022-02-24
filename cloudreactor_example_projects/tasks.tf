module "python_task_role" {
  source = "../modules/ecs_task_role"
  project_name = "cloudreactor-python-ecs-quickstart"
  environment = terraform.workspace
}

module "java_task_role" {
  source = "../modules/ecs_task_role"
  project_name = "cloudreactor-java-ecs-quickstart"
  environment = terraform.workspace
}

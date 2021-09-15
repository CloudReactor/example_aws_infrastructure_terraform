module "python_task_role" {
  source = "../modules/ecs_task_role"
  project_name = "cloudreactor-python-ecs-quickstart"
  environment = terraform.workspace
}

output "deployer_samples_repository_uri" {
  value = aws_ecrpublic_repository.deployer_samples.repository_uri
}

output "deployer_samples_publisher_access_key_id" {
  value = aws_iam_access_key.image_publisher.id
}

output "deployer_samples_publisher_access_key_secret" {
  value = aws_iam_access_key.image_publisher.secret
  sensitive = true
}

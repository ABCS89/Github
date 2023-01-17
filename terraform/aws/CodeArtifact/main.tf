#KMSKEY para o Repo_NPM
resource "aws_kms_key" "code_artifact_encryption_key" {
  description = "Chave encriptada para acesso ao dominio Repo_NPM"
}
#Dominio criado para Repo_NPM
resource "aws_codeartifact_domain" "my_domain" { 
  domain = "my-domain"
  encryption_key = aws_kms_key.code_artifact_encryption_key.arn
}
#Reposito NPM
resource "aws_codeartifact_repository" "Repo_NPM" {
  description = "Repo_NPM"
  domain = aws_codeartifact_domain.my_domain.domain
  repository = "Repo_NPM"
}
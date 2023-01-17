#KMSKEY para o Repositorio-NPM
resource "aws_kms_key" "code_artifact_encryption_key" {
  description = "Chave encriptada para acesso ao dominio Repositorio-NPM"
}

#Dominio criado para Repositorio-NPM
resource "aws_codeartifact_domain" "my_domain" { 
  domain = var.Repositorio_NPM_domain
  encryption_key = aws_kms_key.code_artifact_encryption_key.arn
}

#Reposito NPM
resource "aws_codeartifact_repository" "Repositorio-NPM" {
  description = "Repositorio de NPM "
  domain = aws_codeartifact_domain.my_domain.domain
  repository = var.Repositorio_NPM_name
}
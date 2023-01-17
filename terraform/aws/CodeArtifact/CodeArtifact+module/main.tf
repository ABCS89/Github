module "codeArtifact" {
  source                 = "./module/CodeArtifact"
  Repositorio_NPM_domain = var.Repositorio_NPM_domain
  Repositorio_NPM_name   = var.Repositorio_NPM_name
}
provider "aws" {
  region = "us-east-1"
}

module Taxman {
  source = "./aplicacao/taxman"   
  
}


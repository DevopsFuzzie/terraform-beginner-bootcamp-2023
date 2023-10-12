terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "DevopsFuzzie"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token =var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Why you should watch Heartstopper"
  description = <<DESCRIPTION
Heartstopper is a British coming-of-age romantic comedy-drama television series on Netflix, written and created by Alice Oseman and based on her webcomic and graphic novel of the same name. The series primarily tells the story of Charlie Spring (Joe Locke), a gay schoolboy who falls in love with classmate Nick Nelson (Kit Connor), whom he sits next to in his new form. It also explores the lives of their friends Tao Xu (William Gao), Elle Argent (Yasmin Finney), Isaac Henderson (Tobie Donovan), Tara Jones (Corinna Brown) and Darcy Olsson (Kizzy Edgell).
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
   town = "missingo"
  content_version = 1
}
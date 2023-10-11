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
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

#module "terrahouse_aws" {
#  source = "./modules/terrahouse_aws"
#  user_uuid = var.user_uuid
#  bucket_name = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  content_version = var.content_version
#}

resource "terratowns_home" "home" {
  name = "Why you should watch Heartstopper"
  description = <<DESCRIPTION
Heartstopper is a British coming-of-age romantic comedy-drama television series on Netflix, written and created by Alice Oseman and based on her webcomic and graphic novel of the same name. The series primarily tells the story of Charlie Spring (Joe Locke), a gay schoolboy who falls in love with classmate Nick Nelson (Kit Connor), whom he sits next to in his new form. It also explores the lives of their friends Tao Xu (William Gao), Elle Argent (Yasmin Finney), Isaac Henderson (Tobie Donovan), Tara Jones (Corinna Brown) and Darcy Olsson (Kizzy Edgell).
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fdq3gz.cloudfront.net"
  town = "video-valley"
  content_version = 1
}
packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "mantra_base" {

  region        = var.aws_region
  instance_type = var.instance_type

  
source_ami_filter {
  filters = {
    name                = "amazon-eks-node-1.29-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }

  owners      = ["602401143452"]
  most_recent = true
}

  ssh_username = "ec2-user"
  ami_name     = local.image_name

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name        = "mantra-base"
    Version     = var.image_version
    Environment = "base"
    ManagedBy   = "packer"
  }
}

build {
  sources = ["source.amazon-ebs.mantra_base"]

  provisioner "shell" {
    scripts = [
      "scripts/01-update.sh",
      "scripts/02-hardening.sh",
      "scripts/03-docker.sh",
      "scripts/04-cloudwatch.sh",
      "scripts/05-cleanup.sh",
      "scripts/install_docker.sh",
      "scripts/install_nginx.sh"
    ]
  }
}

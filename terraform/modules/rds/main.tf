resource "aws_db_subnet_group" "rds" {

  name       = "${var.name}-rds-subnet"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.name}-rds-subnet"
  }
}

resource "aws_db_instance" "postgres" {

  identifier = "${var.name}-db"

  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.rds.name

  skip_final_snapshot = true
}

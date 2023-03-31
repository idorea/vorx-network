terraform {
	backend "s3" {
	 bucket = "idorea-vorx-terraform"
	 key = "vorx-network.tfstates"
	 region = "us-east-1"
	}
}

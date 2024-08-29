module "git" {
    source = "git::https://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@github.com/AswaniAtukuri/terraform.git//day-2?ref=main"
    ami="ami-0c0493bbac867d427"
    type = "t2.micro"
    key ="aswni"
    bucket = "aswani-123"



  
}
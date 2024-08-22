variable "ami" {
    description = "inserting ami values to main.tf"
    type = string
    default =""
  
}

variable "type" {
    description = "inserting instance type to main.tf"
    type = string
    default = ""
  
}
variable "key" {
    type = string
    default = ""
  
}
variable "bucket" {
    type = string
    default = ""
  
}
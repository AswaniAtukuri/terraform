variable "name" {
    type = string
    default = "my-target"
  
}
variable "target_type"{
    type =  string
    default = "alb"
} 
  variable "port"{
    type = number
    default = 80
  }
  variable "protocol" {
    type = string
    default = "TCP"
    
  }

  


provider "cloudinit" {
  
}

data "cloudinit_config" "userdata" {
    gzip = false
    base64_encode = false
    
    part {
        content_type = "text/x-shellscript"
        content = templatefile("userdata.sh", {})
    }
}
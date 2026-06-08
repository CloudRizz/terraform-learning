output "web_server_ip" {
  value = aws_instance.web.public_ip
    description = "Public IP address of the web server"
}

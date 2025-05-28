# output "jenkins_public_ip" {
#   value = azurerm_public_ip.jenkins.ip_address
# }

# output "sonar_public_ip" {
#   value = azurerm_public_ip.sonar.ip_address
# }

# output "webgoat_public_ip" {
#   value = azurerm_public_ip.webgoat.ip_address
# }

output "jenkins_url" {
  value = "http://${azurerm_public_ip.jenkins.ip_address}:8080"
}

output "sonar_url" {
  value = "http://${azurerm_public_ip.sonar.ip_address}:9000"
}

output "webgoat_url" {
  value = "http://${azurerm_public_ip.webgoat.ip_address}:8080"
}

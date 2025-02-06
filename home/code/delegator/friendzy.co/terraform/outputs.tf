output "host_ip" {
  value = module.linode.instance_ip
}

output "public_ip" {
  value = module.linode.nodebalancer_ip
}

output "github_usernames" {
  value = toset(flatten([
    for u in values(module.github.users) : u.username
  ]))
}

output "elb_dns_name" {
    value = "${module.webserver_cluster.elb_dns_name}"
}
output "module_version" {
    value = "${module.webserver_cluster.version}"
}
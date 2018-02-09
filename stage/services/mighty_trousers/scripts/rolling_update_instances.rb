plan = `terraform plan | egrep ".*\/.*module.mighty_trousers.aws_instance.app-server"`
plan.split("\n").each do |line|
    line = line.gsub(/.+module/, "module")
    resource = line.gsub(/\(.*\)/, "").split[0]
     puts "terraform apply -auto-approve -target #{resource} -target module.mighty_trousers.aws_elb.load-balancer"
     `terraform apply -auto-approve -target "#{resource}" -target module.mighty_trousers.aws_elb.load-balancer`
    #  sleep may be needed between cycle iteration to allow ELB healthchecks to take service up. At this commit
    # module mighty_trauses example create new instance+destroy old instance time is enought to newly added ELB
    # instance is up and serving requests? but in outher circumstances sleep 30 sec or more may be required
end
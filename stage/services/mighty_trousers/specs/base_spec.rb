# Install: 
# sudo apt-get install libtool autoconf
# sudo gem install inspec
# Run:
# inspec exec specs/base_spec.rb -t ssh://ubuntu@$(terraform output mighty_trousers_public_ip) -i id_rsa 

describe package('wget') do
    it { should be_installed }
end
# InSpec test for recipe apache::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/


describe command('curl http://localhost') do
  its(:stdout) { should match(/Welcome Home/) }
end
describe port('80') do
  it { should be_listening }
end
describe package('httpd') do
  it { should be_installed}
end
describe file('/var/www/html/index.html') do
  it { should exist }  
end
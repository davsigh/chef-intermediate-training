# InSpec test for recipe apache::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'Debian' do
  impact 0.7
  title 'Debian/ubuntu integration testing'
  desc 'Test package, file, service and port'
  only_if { os.debian? }
  describe package('apache2') do
    it { should be_installed }
  end
end
control 'Redhat & Centos' do
  impact 0.7
  title 'Centos testing'
  desc 'Centos package...'
  only_if { os.redhat? }
  describe package('httpd') do
    it { should be_installed }
  end
end

describe command('curl http://localhost') do
  its(:stdout) { should match(/Welcome Home/) }
end
describe command('curl http://localhost:8080') do
  its(:stdout) { should match(/Welcome admins/) }
end

describe port('80') do
  it { should be_listening }
end
describe file('/var/www/html/index.html') do
  it { should exist }
end
describe port('8080') do
  it { should be_listening }
end

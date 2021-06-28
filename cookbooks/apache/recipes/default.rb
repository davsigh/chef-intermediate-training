#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package 'httpd' do
    action :install
end
file '/var/www/html/index.html' do
    content 'Welcome Home'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end
service 'httpd' do
    action [:start, :enable]
end



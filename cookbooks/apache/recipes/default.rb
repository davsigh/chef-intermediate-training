#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
package node['apache']['package_name']
file node['apache']['default_index_html'] do
    content 'Welcome Home'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end
service node['apache']['service_name'] do
    action [:start, :enable]
end


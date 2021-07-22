#
# Cookbook:: users
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
davinder_password = data_bag_item('passwords', 'davinder')
user 'davinder' do
    comment 'First name and last name'
    uid '2000'
    home '/home/davinder'
    shell '/bin/bash'
    password davinder_password['password']
    action :create
end

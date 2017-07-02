#
# Cookbook Name:: homeusers
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


#Using the chef vault

chef_gem 'chef-vault' do
 compile_time true if respond_to?(:compile_time)
end

require 'chef-vault'
if node['platform'] == "mac_os_x"
   %w(madhu).each do | user |
    user_properties = data_bag_item("homeusers-dev", "#{user}")
    user "#{user}" do
      home "/home/#{user_properties['id']}"
      shell '/bin/bash'
      password user_properties['password']
      manage_home true
      action :create
    end
   end
else
  %w(madhu).each do | user |
   user_properties = ChefVault::Item.load("homeusers-test", "#{user}")
   user "#{user}" do
     home "/home/#{user_properties['id']}"
     shell '/bin/bash'
     password user_properties['password']
     manage_home true
     action :create
   end
  end
end

#
# Cookbook Name:: gemtest
# Recipe:: default
#
# Copyright (c) 2017 Kurt Wallander, All Rights Reserved.

ipvaule = AssignIP.assign_IP("192.168.10.1/24")

file '/home/testfile' do 
    content "#{ipvaule}"
    action :create 
    mode 0755
    owner 'root'
end 
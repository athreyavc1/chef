#
# Cookbook Name:: filetester
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Resource.send(:include, Helper)

file '/home/vagrant/testfilexoo'
	content artifact_link
end
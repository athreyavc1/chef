#
# Cookbook Name:: parameterdef
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default["filepath"]	= "/home/parameterdeffile"
node.default["content"]		= "This is a parameterdef"

parafile do 
	path "#{node.default["filepath"]}"
	content "#{node.default["content"]}"
end
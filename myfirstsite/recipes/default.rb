#
# Cookbook Name:: myfirstsite
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apache2'

node.default['apache']['docroot_dir']   = "/var/www/mysite"

directory "#{node.default['apache']['docroot_dir']}" do
	mode '0755'
	owner 'root'
	action :create
end

template "#{node.default['apache']['docroot_dir']}/index.html" do
	source 'index.html.erb'
	mode '0755'
	owner 'root'
	action :create
end

 web_app "mysite" do
      server_name node['hostname']
      server_aliases [node['fqdn'], "my-site.example.com"]
      docroot "#{node.default['apache']['docroot_dir']}"
      cookbook 'apache2'
 end

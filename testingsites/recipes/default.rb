#
# Cookbook Name:: testingsites
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe 'apache2::mod_authz_core'
include_recipe 'apache2::mod_authz_host'

node.default['apache']['myport'] = "443"



web_app 'mytestingsite' do
	template 'web_app.conf.erb'
    server_name node['hostname']
    listen_ports node['apache']['myport']
end



#
# Cookbook Name:: filetester
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default['home']['webroot'] 	= '/var/www/html'
node.default['home']['appowner']	= 'www-data'
node.default['home']['appowner']    = 'www-data'
node.default['home']['projectname'] = 'lacegant'
node.default['home']['port']		= '80'

home_site_deploy "lacegant" do 
	deploy_to		"/opt/#{node['home']['projectname']}.zip"
	deploy_path 	node['home']['webroot']
	project_name	node['home']['projectname']
	web_root		node['home']['webroot']
	site_template   'mytemplate.erb'
	site_owner		node['home']['appowner']
end
#
# Cookbook Name:: mytestsite
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['home']['webroot'] 	= '/var/www/html'
node.default['home']['appowner']	= 'www-data'
node.default['home']['appowner']    = 'www-data'
node.default['home']['projectname'] = 'lacegant'
node.default['home']['port']		= '80'

package 'apache2' do
end

service 'apache2' do
  supports :restart => true, :reload => true
  action :enable
end

<<<<<<< HEAD
remote_file  "/opt/#{node['home']['projectname']}.zip" do
  source  "http://192.168.1.71/data/artifacts/lacegant.zip"
=======

artifact_file  "/opt/#{node['home']['projectname']}.zip" do
  location  "http://www.free-css.com/assets/files/free-css-templates/download/page211/lacegant.zip"
>>>>>>> 7a9f626a8526a2d317df3de5255e19b34a4b9fe0
  owner "root"
  group "root"
  action :create
end

web_app "#{node['home']['projectname']}" do
	template 'web-config.erb'
	notifies :reload, 'service[apache2]', :delayed
end


<<<<<<< HEAD
zipfile "/opt/#{node['home']['projectname']}.zip" do
	into "#{node['home']['webroot']}"
	not_if {  ::Dir.exist?("#{node['home']['webroot']}/#{node['home']['projectname']}")}
=======
zipfile "/opt/#{node['home']['projectname']}.zip" do 
	into "#{node['home']['webroot'] }"
	not_if { File.exists?("#{node['home']['webroot']}/#{node['home']['projectname']}")}
>>>>>>> 7a9f626a8526a2d317df3de5255e19b34a4b9fe0
end

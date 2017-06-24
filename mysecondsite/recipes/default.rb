#
# Cookbook Name:: mysecondsite
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'definedsites'

node.default['homelab']['sitename'] 		= "mysecondsite"
node.default['homelab']['port'] 			= "443"
node.default['homelab']['ssl_cert'] 		= "/etc/httpd/ssl/apache.crt"
node.default['homelab']['ssl_key'] 			= "/etc/httpd/ssl/apache.key"
node.default['homelab']['site_docroot']		= "/var/www/mysecondsite"
node.default['homelab']['sslcertsource']	= "apache.crt"
node.default['homelab']['sslcertkey']		= "apache.key"
node.default['homelab']['index_name']		= "index.html"
node.default['homelab']['indexsource']		= "index.html.erb"


mycustomsite "#{node['homelab']['sitename']}"  do
	listen_myport 	node['homelab']['port']
	site_name		node['homelab']['sitename']
	site_cert 		node['homelab']['ssl_cert']
	site_key		node['homelab']['ssl_key']
	site_docroot	node['homelab']['site_docroot']
	sslcertsource	node['homelab']['sslcertsource']
	sslkeysource	node['homelab']['sslcertkey']
	index_name      node['homelab']['index_name']
	indexsource		node['homelab']['indexsource']
end

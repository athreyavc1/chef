#
# Cookbook Name:: casetest
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

osplatform = node[:platform]
case osplatform
when 'ubuntu'
	puts "The client is a Ubuntu Machine"
when 'redhat'
	puts "This is not a Ubuntu Machine"
end

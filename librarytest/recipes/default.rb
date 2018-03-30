#
# Cookbook Name:: librarytest
# Recipe:: default
#
# Copyright (c) 2017 Kurt Wallander, All Rights Reserved.

execute 'touching file' do 
	command "touch /tmp/stop_chef"
	not_if { StopFile.stop_file_exists? }
end 
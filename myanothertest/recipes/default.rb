#
# Cookbook Name:: myanothertest
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'filetester'
myfiletester "createmyfile" do
  filesource "/home/vagrant/gammmmmmfile"
end

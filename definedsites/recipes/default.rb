#
# Cookbook Name:: definedsites
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'apache2::mod_authz_host'
include_recipe 'apache2::mod_ssl'

#
# Cookbook:: homelab-openvpn
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node['openvpn']['configure_default_server'] = false
include_recipe 'openvpn::server'

#
# Cookbook:: homelab-openvpn
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['openvpn']['port'] = "1194"
#node.default['openvpn']['user'] = "vagrant"
#node.default['openvpn']['group'] = "vagrant"
node.default['openvpn']['config_dir'] = "/etc/openvpn"
include_recipe 'openvpn::install'

node.default['openvpn']['configure_default_server'] = false

include_recipe "openvpn::server"

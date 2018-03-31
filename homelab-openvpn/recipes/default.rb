#
# Cookbook:: homelab-openvpn
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['openvpn']['port'] = "1194"
node.defaut['openvpn']['user'] = "vagrant"
node.defaut['openvpn']['group'] = "vagrant"
node.default['openvpn']['config_dir'] = "/etc/openvpn"
include_recipe 'openvpn::install'

node.default['openvpn']['configure_default_server'] = false
node.default['openvpn']['config'] = { "port": node['openvpn']['port'],
          "server":  "192.168.1.0  255.255.255.0",
          "proto": "udp"
          "verb":  "3",
          "cert":  "#{node['openvpn']['config_dir']}/server.crt",
          "key" :  "#{node['openvpn']['config_dir']}/server.key",
          "dh":    "#{node['openvpn']['config_dir']}/dh.pem",
          "user":  node['openvpn']['user'],
          "group": node['openvpn']['group'],
          "push":  ["\"dhcp-option DNS 8.8.8.8\"", "\"dhcp-option DNS 8.8.4.4\""]
        }

%w(server.crt,dh.pem,server.key).each do | line | 
  cookbook_file "#{node['openvpn']['config_dir']}/#{line}" do 
    source "#{line}"
    chmod 0600
    owner node['openvpn']['user']
    group node['openvpn']['group']
  end 
end 
openvpn_conf 'server' do
  config  node['openvpn']['config']
end

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

node.default['openvpn']['config'] = { "port": node['openvpn']['port'],
          "server":  "192.168.1.0  255.255.255.0",
          "verb": "3",
          "cert":  "#{node['openvpn']['config_dir']}/server.crt",
          "key": "#{node['openvpn']['config_dir']}/server.key",
          "dh":  "#{node['openvpn']['config_dir']}/dh.pem",
          "user": node['openvpn']['user'],
          "group": node['openvpn']['group'],
          "push":  ["\"dhcp-option DNS 8.8.8.8\"", "\"dhcp-option DNS 8.8.4.4\""]
        }

openvpn_conf 'server' do
  config  node['openvpn']['config']
end

%w(server.crt dh.pem server.key).each do | line |
  cookbook_file "/etc/openvpn/#{line}" do
    source "#{line}"
    mode 0600
    owner "vagrant"
    group "vagrant"
    action :create
  end
end

#openvpn_conf 'server' do
#  config  node['openvpn']['config']
#end

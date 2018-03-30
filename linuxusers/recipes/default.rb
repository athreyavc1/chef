#
# Cookbook Name:: linuxusers
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.


user 'random' do
  manage_home true
  comment 'User Random'
  home '/home/random'
  shell '/bin/bash'
  password '$1$JJsvHslV$szsCjVEroftprNn4JHtDi'
end

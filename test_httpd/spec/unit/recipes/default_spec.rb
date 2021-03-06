#
# Cookbook Name:: test_httpd
# Spec:: default
#
# Copyright (c) 2017 Kurt Wallander, All Rights Reserved.

require 'spec_helper'

describe 'test_httpd::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) 
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end 

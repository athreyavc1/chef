#
# Cookbook:: artifacttest
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

artifact_file  "/opt/test.zip" do
  location  "http://www.free-css.com/assets/files/free-css-templates/download/page211/lacegant.zip"
  owner "root"
  group "root"
  action :create
end
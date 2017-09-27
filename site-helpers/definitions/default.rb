Chef::Resource.send(:include, Helper)


define :home_site_deploy, :deploy_path => nil, :project_name => nil, :web_root => nil, :site_template => nil, :site_owner => nil, :deploy_to => nil do 



	site_deploy_path 		= params[:deploy_path]
	site_name			      = params[:project_name]
	site_root			      = params[:web_root]
	mytemplte			      = params[:site_template]
	owner               = params[:site_owner]
  deploy_to_file          = params[:deploy_to]


	package 'apache2' do
    end

    service 'apache2' do
     supports :restart => true, :reload => true
     action :enable
    end

    remote_file  deploy_to_file do
  		source  artifact_link
  		owner   owner
  		group owner
	end

  directory "#{site_root}/#{site_name}" do
  owner owner
  group owner
  mode '0755'
  action :create
end

  #zipfile deploy_to_file do
	 #into "#{site_root}/#{site_name}"
	 #not_if {  ::Dir["#{site_root}/#{site_name}/*"].length > 0}
    #end

    artifact_deploy site_name do 
      deploy_to "#{site_root}/#{site_name}"
      

    web_app site_name do
	 template mytemplte
	 notifies :reload, 'service[apache2]', :delayed
    end
end
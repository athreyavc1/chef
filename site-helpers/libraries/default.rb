module Helper
	include Chef::Mixin::ShellOut
    def artifact_link
    	env=node.chef_environment
    	download_artifact = "http://192.168.1.71/website-#{env}.zip"
    	return download_artifact
    end 
end 


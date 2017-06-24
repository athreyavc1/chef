
define :mycustomsite, :listen_myport => nil, :site_name => nil, :site_cert => nil , :site_key => nil, :site_docroot => nil,  :sslcertsource => nil, :sslkeysource => nil, :index_name => nil, :indexsource => nil do
 port            = params[:listen_myport]
 sitename        = params[:site_name]
 sslcert	     = params[:site_cert]
 sslkey		     = params[:site_key]
 sdocroot 	     = params[:site_docroot]
 source_ssl_cert = params[:sslcertsource]
 source_ssl_key  = params[:sslkeysource]
 indexfile       = params[:index_name]
 index_source    = params[:indexsource]
 index_file_path  = "#{sdocroot}/#{indexfile}"


 directory "#{sdocroot}" do
   owner 'apache'
   mode   0755
   action :create
 end

 cookbook_file "#{sslcert}" do
   source "#{source_ssl_cert}"
   owner 'root'
   mode 0755
   action :create
 end

 cookbook_file "#{sslkey}" do
   source "#{source_ssl_key}"
   owner 'root'
   mode 0755
   action :create
 end

  template "#{index_file_path}" do
    source "#{index_source}"
    owner "apache"
    mode 0755
    action :create
  end

  web_app "#{sitename}" do
    template "web_app.conf.erb"
    docroot "#{sdocroot}"
  end

end



define :myfiletester,  :filesource => nil  do

  file_source  = params[:filesource]

 template "#{file_source}" do
   source "testing.conf.erb"
   owner  "vagrant"
   mode   0755
   cookbook "filetester"
 end
end

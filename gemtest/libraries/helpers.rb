require 'ipaddress'

class Chef::Recipe::AssignIP
   def self.assign_IP(ipblock)
     ip = IPAddress(ipblock)
     return ip 
   end 
end 
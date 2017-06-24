define :parafile,:path => nil,:content => nil do
	file "#{params[:path]}" do 
		content "#{params[:content]}"
	end
end
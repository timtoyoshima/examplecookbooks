log node[:phpapp2][:dbtable].inspect

template "#{node[:deploy][:myphpapp2][:deploy_to]}/current/db-connect.php" do
  source "db-connect.php.erb"
  mode 0660
  node[:deploy][:group]

if platform?("ubuntu")
  owner "www-data"
elsif platform?("rhel") && platform_family?("amazon")   
  owner "apache"
end


  variables(
      :host =>     (node[:deploy][:myphpapp2][:database][:host] rescue nil),
      :user =>     (node[:deploy][:myphpapp2][:database][:username] rescue nil),
      :password => (node[:deploy][:myphpapp2][:database][:password] rescue nil),
      :db =>       (node[:deploy][:myphpapp2][:database][:database] rescue nil),
      :table =>    (node[:phpapp2][:dbtable] rescue nil)
  )

 only_if do
   File.directory?("#{node[:deploy][:myphpapp2][:deploy_to]}/current")
 end
end

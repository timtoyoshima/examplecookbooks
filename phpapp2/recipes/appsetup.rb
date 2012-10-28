log node[:deploy][:myphpapp2].inspect

template "#{node[:deploy][:myphpapp2][:deploy_to]}/db-connect.php" do
  source "db-connect.php.erb"
  mode 0660
  node[:deploy][:group]
  node[:deploy][:user]
  variables(
      :host =>     (node[:deploy][:myphpapp2][:database][:host] rescue nil),
      :user =>     (node[:deploy][:myphpapp2][:database][:username] rescue nil),
      :password => (node[:deploy][:myphpapp2][:database][:password] rescue nil),
      :db =>       (node[:deploy][:myphpapp2][:database][:database] rescue nil)
  )

 only_if do
   File.directory?("#{node[:deploy][:myphpapp2][:deploy_to]}/current")
 end
end

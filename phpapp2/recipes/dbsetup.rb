execute "mysql-create-table" do
  command "/usr/bin/mysql -u#{node[:deploy][:myphpapp2][:database][:username]} -p#{node[:deploy][:myphpapp2][:database][:password]} #{node[:deploy][:myphpapp2][:database][:database]} -e'CREATE TABLE #{node[:phpapp2][:dbtable]}(
   time int(11) NOT NULL, 
   name varchar(30) NOT NULL, 
   ip varchar(15) NOT NULL, 
   message varchar(255) NOT NULL, 
   PRIMARY KEY (time)
)'"
  not_if "/usr/bin/mysql -u#{node[:deploy][:myphpapp2][:database][:username]} -p#{node[:deploy][:myphpapp2][:database][:password]} #{node[:deploy][:myphpapp2][:database][:database]} -e'SHOW TABLES' | grep [:phpapp2][:dbtable]"
  action :run
end


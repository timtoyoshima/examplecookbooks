execute "mysql-create-table" do
  command "/usr/bin/mysql -u#{node[:deploy][:myphpapp][:database][:username]} -p#{node[:deploy][:myphpapp][:database][:password]} #{node[:deploy][:myphpapp][:database][:database]} -e'CREATE TABLE #{node[:phpapp][:dbtable]}(
   time int(11) NOT NULL, 
   name varchar(30) NOT NULL, 
   ip varchar(15) NOT NULL, 
   message varchar(255) NOT NULL, 
   PRIMARY KEY (time)
)'"
  not_if "/usr/bin/mysql -u#{node[:deploy][:myphpapp][:database][:username]} -p#{node[:deploy][:myphpapp][:database][:password]} #{node[:deploy][:myphpapp][:database][:database]} -e'SHOW TABLES' | grep [:phpapp][:dbtable]"
  action :run
end


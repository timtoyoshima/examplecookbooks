execute "mysql-create-table" do
  command "/usr/bin/mysql -u#{node[:deploy][:myphpapp2][:database][:username]} -p#{node[:deploy][:myphpapp2][:database][:password]} -e"CREATE TABLE chat(
   time int(11) NOT NULL, 
   name varchar(30) NOT NULL, 
   ip varchar(15) NOT NULL, 
   message varchar(255) NOT NULL, 
   PRIMARY KEY (time)
) #{node[:deploy][:myphpapp2][:database][:database]}"
  action :run
end


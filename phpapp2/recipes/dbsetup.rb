execute "mysql-create-db" do
  command "/usr/bin/mysql -u root CREATE DATABASE #{node['myphpapp2']['dbname']}"
  action :run
end

execute "mysql-create-table" do
  command "/usr/bin/mysql -u root CREATE TABLE #{node['myphpapp2']['dbtable']} ( 
   time int(11) NOT NULL, 
   name varchar(30) NOT NULL, 
   ip varchar(15) NOT NULL, 
   message varchar(255) NOT NULL, 
   PRIMARY KEY (time)
  )"
  action :run
end

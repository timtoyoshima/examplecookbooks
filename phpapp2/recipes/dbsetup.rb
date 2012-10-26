execute "mysql-create-db" do
  command "/usr/bin/mysql -u root CREATE DATABASE chat"
  action :run
end


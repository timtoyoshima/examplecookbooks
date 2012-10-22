user "redis" do
  shell "/bin/zsh"
  action :create
end

directory node[:redis][:datadir] do
  owner node[:redis][:user]
  group 'users'
  mode '0755'
end

directory File.dirname(node[:redis][:log_file]) do
  action :create
  owner node[:redis][:user]
  group 'root'
  mode '0755'
end


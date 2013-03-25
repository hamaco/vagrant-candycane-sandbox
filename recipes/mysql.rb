%w{ mysql mysql-server }.each do |package|
  package package do
    action :install
  end
end

service 'mysqld' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

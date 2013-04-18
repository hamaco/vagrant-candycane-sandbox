package 'httpd' do
  action :install
end

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

cookbook_file "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[httpd]'
end

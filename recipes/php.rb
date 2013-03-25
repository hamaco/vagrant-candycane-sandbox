%w{ php php-mysql php-xml php-pecl-xdebug }.each do |package|
  package package do
    action :install
  end
end
cookbook_file "/etc/php.ini" do
  source "php.ini"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[httpd]'
end

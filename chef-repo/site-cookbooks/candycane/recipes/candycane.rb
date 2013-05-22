cookbook_file "/etc/httpd/conf.d/candycane.vagrant.dev.conf" do
  source "candycane.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[httpd]'
end

git "/var/www/html/candycane.vagrant.dev" do
  repository "git://github.com/hamaco/candycane.git"
  action :sync
end

bash "change-permission" do
  user "root"
  group "root"

  code <<-EOH
    cd /var/www/html/candycane.vagrant.dev
    chmod 777 app/Config
    chmod 777 app/files
    chmod -R 777 app/tmp
    chmod -R 777 app/Plugin
  EOH
end

cookbook_file "/var/www/html/candycane.vagrant.dev/app/Vendor/candycane/PluginContainer.php" do
  source "PluginContainer.php"
  owner "apache"
  group "apache"
  mode 0644
end

%w{ "candycane" "cakephp_test" "cakephp_test2" "cakephp_test3" }.each do |db_name|
  bash "candycane database #{db_name}" do
    not_if "mysql -uroot -e 'show databases;' | grep #{db_name}"

    code <<-EOH
      mysql -uroot -e "create database #{db_name} charset utf8;"
    EOH
  end
end

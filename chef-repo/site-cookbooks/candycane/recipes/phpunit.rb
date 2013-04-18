# PHPUnitのインストールが重たすぎるので保留

# cookbook_file "/var/www/html/candycane.vagrant.dev/app/Config/database.php" do
#   source "database.php"
#   owner "apache"
#   group "apache"
#   mode 0644
# end
#
# %w{ pear.phpunit.de pear.symfony.com }.each do |channel|
#   php_pear_channel channel do
#     action [:discover, :update]
#   end
# end
#
# php_pear "PHPUnit" do
#   channel "phpunit"
#   #version node['phpunit']['version']
#   action :install
# end

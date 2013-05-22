require 'spec_helper'

%w(php php-mbstring php-mysql php-xml php-pecl-xdebug).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/etc/httpd/conf.d/php.conf') do
  it { should be_file }
end

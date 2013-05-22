require 'spec_helper'

describe selinux do
  it { should be_disabled }
end

describe iptables do
  it { should be_disabled }
end

describe file('/etc/hosts') do
  it { should be_file }
  it { should contain '127.0.0.1   candycane.vagrant.dev' }
end

describe file('/etc/httpd/conf.d/candycane.vagrant.dev.conf') do
  it { should be_file }
  it { should contain 'ServerName candycane.vagrant.dev' }
end

service 'iptables' do
  action [:disable, :stop]
end

%w{ git }.each do |package|
  package package do
    action :install
  end
end

cookbook_file "/etc/hosts" do
  source "hosts"
  owner "root"
  group "root"
  mode 0644
end

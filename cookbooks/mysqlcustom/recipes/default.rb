#
# Cookbook Name:: mysqlcustom
# Recipe:: default
#
if node[:instance_role] == "db_master"
	service 'mysql' do
		supports :status => true
		action [:enable, :start]
	end

	template '/etc/mysql/my.cnf' do
        	source 'my.cnf.erb'
		owner "root"
		group "root"
		mode  00644
		notifies :restart, "service[mysql]", :delayed
	end
end

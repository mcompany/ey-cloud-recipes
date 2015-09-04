#
# Cookbook Name:: mysqlcustom
# Recipe:: default
#
if node[:instance_role] == "db_master"
	template '/etc/mysql/my.cnf' do
        	source 'my.cnf.erb'
		owner "root"
		group "root"
		mode  00644
		notifies :reload, "service[mysql]", :delayed
	end
end

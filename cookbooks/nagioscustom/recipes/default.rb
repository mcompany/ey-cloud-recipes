#
# Cookbook Name:: nagioscustom
# Recipe:: default
#
if node[:instance_role] == "db_master"
	#mask for package
	file '/etc/portage/package.use/nagios'	do
		content 'net-analyzer/nagios-core -apache2'
		mode 00644
		owner "root"
		group "root"
	end
	
	pakage	'mtr' do
		version '0.82'		
	end
		 
	#service 'mysql' do
	#	supports :status => true
	#	action [:enable, :start]
	#end

	#template '/etc/mysql/my.cnf' do
        #	source 'my.cnf.erb'
	#	owner "root"
	#	group "root"
	#	mode  00644
	#	notifies :restart, "service[mysql]", :delayed
	#end
end

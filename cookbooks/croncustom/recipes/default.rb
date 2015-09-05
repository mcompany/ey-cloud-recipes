#
# Cookbook Name:: croncustom
# Recipe:: default
#

Chef::Log.info "#{node[:instance_role]}"

ey_cloud_report "croncustom" do 
  message "message from recipe croncustom" 
end 

if node[:instance_role] == "util"
	execute 'clear_deploy_crontab' do
  		command 'crontab -u deploy -r'
	end
	execute 'install_deploy_crontab' do
                command 'crontab -u deploy /data/archive/latest_crontab'
        end
end


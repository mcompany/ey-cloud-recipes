#
# Cookbook Name:: croncustom
# Recipe:: default
#

if node[:instance_role] == "util"
	execute 'clear_deploy_crontab' do
  		command 'crontab -u deploy -r'
	end
	execute 'install_deploy_crontab' do
                command 'crontab -u deploy /data/archive/latest_crontab'
        end
end


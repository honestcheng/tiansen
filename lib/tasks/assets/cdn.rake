require 'ftp_sync'
namespace :assets do
  desc 'sync assets to cdns'
  task :cdn => :environment do 
    ftp = FtpSync.new("v0.ftp.upyun.com", ['2prodfile','twoprodfile'].join("/"), '2prodfile',true)
    ftp.sync("#{Rails.root}/public/assets/", "/assets")
  end
end

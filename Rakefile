desc 'refresh environment'
task :environment do
    require_relative './config/environment'
end

desc 'launch Pry console'
task :console => :environment do
    Pry.start
end

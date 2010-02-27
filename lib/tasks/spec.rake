namespace :cleve2030 do
  task :spec => :environment do
    require 'spec'
    require 'spec/rails'
    exec 'rake spec'
  end
end


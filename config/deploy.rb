# Please install the Engine Yard Capistrano gem
# gem install eycap --source http://gems.engineyard.com
require "eycap/recipes"

set :keep_releases, 5
set :application,   'advance2030'
set :repository,    'git://github.com/advance2030/advance2030.git'
set :deploy_to,     "/data/#{application}"
set :deploy_via,    :export
set :monit_group,   "#{application}"
set :scm,           :git
set :git_enable_submodules, 1
# This is the same database name for all environments
set :production_database,'advance2030_production'

set :environment_host, 'localhost'
set :deploy_via, :remote_cache

# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
default_run_options[:pty] = true # required for svn+ssh:// andf git:// sometimes

# This will execute the Git revision parsing on the *remote* server rather than locally
set :real_revision, 			lambda { source.query_revision(revision) { |cmd| capture(cmd) } }


task :advance2030_development do
  role :web, '184.73.245.86'
  role :app, '184.73.245.86'
  role :db,  '184.73.245.86', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'deploy'
  set :dbpass,        'K8jlBbHb0f'
  set :user,          'deploy'
  set :password,      'K8jlBbHb0f'
  set :runner,        'deploy'
  set :rails_env,     'development'
end


task :QA do
  role :web, '184.73.224.112'
  role :app, '184.73.224.112'
  role :db,  '184.73.224.112', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'deploy'
  set :dbpass,        'bsNyATbdFY'
  set :user,          'deploy'
  set :password,      'bsNyATbdFY'
  set :runner,        'deploy'
  set :rails_env,     'staging'
end

# TASKS
# Don't change unless you know what you are doing!

after "deploy", "deploy:cleanup"
after "deploy", "bundle:install"
after "deploy:migrations", "deploy:cleanup"
after "deploy:update_code","deploy:symlink_configs"

namespace :nginx do
  task :start, :roles => :app do
    sudo "nohup /etc/init.d/nginx start > /dev/null"
  end

  task :restart, :roles => :app do
    sudo "nohup /etc/init.d/nginx restart > /dev/null"
  end
end

namespace :bundle do
  task :install, :roles => :app do
    run "cd #{current_release} && bundle install"
  end
end

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

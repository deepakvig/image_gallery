require "bundler/capistrano"

set :application, "deepakvig.com"
set :env, "production"

set :scm, "git"
set :repository, "git@github.com:deepakvig/image_gallery.git"
set :branch, "master"

set :user, "deepakvig"
set :password, "d33180pak"
set :runner, user
set :use_sudo, false

set :servers, "deepakvig.com"

set :deploy_to, "/home/#{user}/domains/#{application}"

role :app, servers
role :web, servers
role :db, servers, :primary => true

default_run_options[:pty] = false
ssh_options[:forward_agent] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

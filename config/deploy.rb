# config valid only for Capistrano 3.1
lock '3.1.0'
 
set :application, 'revolution'
set :deploy_user, 'deploy'
 
set :scm, :git
set :repo_url, 'https://github.com/timothycommoner/revolution.cheap.git'
 
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
 
# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/revolution'
 
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.5'
 
 
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
 
namespace :deploy do
 
  # desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd /var/www/revolution/current && bundle exec thin restart -e production"  ## -> line you should add
    end
  end
  #after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'
  after :publishing, :restart
end
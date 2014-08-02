# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'akanodemo'
set :scm, :git
set :repo_url, 'https://github.com/erosroad/akanodemo.git'
set :deploy_to, '/var/www/akanodemo'
set :branch, 'master'

set :ssh_options, {
  keys: [File.expand_path('~/.ssh/id_rsa')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

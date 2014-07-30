# -*- coding: utf-8 -*-
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3) # 子プロセスいくつ立ち上げるか
timeout 15 #15秒Railsが反応しなければWorkerをkillしてタイムアウト
preload_app true #後述

application = 'akanodemo'

listen "/tmp/unicorn_#{application}.sock"
pid "/tmp/unicorn_#{application}.pid"

worker_processes 6
preload_app true

# capistrano 用に RAILS_ROOT を指定
working_directory "/var/www/#{application}"

if ENV['RAILS_ENV'] == 'production'
  shared_path = "/var/www/#{application}/shared"
  stderr_path = "#{shared_path}/log/unicorn.stderr.log"
  stdout_path = "#{shared_path}/log/unicorn.stdout.log"
end

# ログ
stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

# ダウンタイムなくす
preload_app true

before_fork do |server, worker|
  old_pid = "#{ server.config[:pid] }.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      # 古いマスターがいたら死んでもらう
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

def rails_root
  require "pathname"
  Pathname.new(__FILE__) + "../../"
end

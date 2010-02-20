after "deploy:symlink", "deploy:symlink_configs"

namespace :deploy do

  desc "Start the app"
  task :start, :roles => :app do
    sudo "a2ensite #{vhost}"
    sudo "/etc/init.d/apache2 reload"
  end

  desc "Stop the app"
  task :stop, :roles => :app do
    sudo "a2dissite #{vhost}"
    sudo "/etc/init.d/apache2 reload"
  end

  desc "Restart the app"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink config files"
  task :symlink_configs, :roles => :app, :except => { :no_symlink => true } do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

end

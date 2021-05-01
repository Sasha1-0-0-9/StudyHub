server "46.101.94.118", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "studyhub"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "46.101.94.118"
set :puma_conf, "#{shared_path}/config/puma.rb"
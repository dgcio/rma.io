set :stage, :production
set :branch, "master"

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :server_name, "www.warehouseapp.net warehouseapp.net"


server 'dgc.io', user: 'dan', roles: %w{web app db}, primary: true

set :deploy_to, "/wh"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 1

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false
set :branch, 'main'
set :resque_rails_env, 'production'
set :stage, :production

# Set Nginx config
set :nginx_server_name, "api.inventory"
set :nginx_config_name, "inventory_api"
append :linked_files, "config/credentials/production.key"


# The server-based syntax can be used to override options:
# ------------------------------------
server "140.238.251.178",
       user: "deploy",
       roles: %w{web app db},
       ssh_options: {
         user: "deploy", # overrides user setting above
         keys: %w(~/.ssh/id_rsa),
         forward_agent: false,
         auth_methods: %w(publickey)
         # password: "please use keys"
       }

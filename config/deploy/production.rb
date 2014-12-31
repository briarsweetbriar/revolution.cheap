set :stage, :production
set :password, ask('Server password:', nil)
 
# Replace 127.0.0.1 with your server's IP address!
server '104.131.228.131', user: 'deploy', roles: %w{web app}, password: fetch(:password)
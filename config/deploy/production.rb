set :stage, :production
set :password, ask('Server password:', nil)
 
# Replace 127.0.0.1 with your server's IP address!
server '104.236.161.42', user: 'deploy', roles: %w{web app}, password: fetch(:password)
get '/create/user/?' do
  redirect to('/login/stage/1/') unless session? && session[:logged_in] && session[:server_id]
  server = Server[:id => session[:server_id]]
  output = @header
  output << partial(:create_user, :locals => {
    server_name: server.server_name,
    server_welcome: server.server_welcome,
    server_img_url: server.server_img_url
    })
  output << partial(:footer)
end

post '/create/user/?' do
  redirect to('/login/stage/1/') unless session? && session[:logged_in] && session[:server_id]
  required_params = [
    "username",
    "password"]

  required_params.each do |param|
    if (!params[param]) then
      redirect to('/create/user/')
    end
  end

  
end
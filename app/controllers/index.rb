get '/' do
  @users = User.all
  
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
    p params
    @user = User.authenticate(:email => params[:email],
                              :password => params[:password])
  if @user
     session[:user_id] = @user.id
    redirect to '/'
  else
    redirect to '/'
  end


end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  new_user = User.create(params[:user])
  if new_user.invalid?
    p @errors =  new_user.errors
    erb :errors
  else        
  session[:user_id] = new_user.id
  redirect '/'
end

end

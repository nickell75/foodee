
	# index.  >??????  Not sure if i need this. ????????<
	get '/users' do
		@users = user.all
		@users.map{|user| user.email}.to_s
		erb :'users/index'
	end


	# new
	get '/users/new' do
		@user = user.new
		erb :'users/new'
	end


	# create new user account
	post '/users' do
		@user = user.create(params[:user])
		if @user. valid?
			redirect '/users'
		else
			status 422
			@errors = @user.errors.full_messages
			erb:'users/new'
		end
	end


	# show - profile page after logged in
	get '/users/:id' do
		@user = user.find(params[:id])
		@user.email
			erb :'users/show'
	end


	# edit -- change profile 
	get '/users/:id/edit' do
		@user = user.find(params[:id])
			erb :'users/edit'
	end


	# update.   >??????  Not sure if i need this. ????????<
	def update_user
		@user = user.find(params[:id])
		@user.update(params[:user])
			if @user. valid?
				redirect "/users/#{@user.id}"
			else
				status 422
				@errors = @user.errors.full_messages
				erb:'users/new'
			end
	end


	patch '/users/:id' do
		update_user
	end


	put '/users/:id' do
		update_user
	end


	# delete -- delete user from website
	delete '/users/:id' do
		user.find(params[:id]).destroy!
		redirect '/users'
	end

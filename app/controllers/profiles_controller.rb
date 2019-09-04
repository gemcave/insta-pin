class ProfilesController < ApplicationController
	before_action :set_user

	def show 
	end

	def subscribe 
		if current_user.id == @user.id
			redirect_to profile_path(@user), notice: "Вы не можете подписаться на самого себя"
		else
			if current_user.subscriptions.exists?(friend_id: @user.id)
				redirect_to profile_path(@user), notice: "Вы уже подписались на данного пользователя"
			else
				@subscription = current_user.subscriptions.build
				@subscription.friend_id = @user.id
				@subscription.save
				if @subscription.save
					redirect_to profile_path(@user), notice: "Вы подписались на данного пользователя"
				end
			end
		end
	end

	def unsubscribe 
		if current_user.id == @user.id
			redirect_to profile_path(@user), notice: "Вы не можете подписаться на самого себя"
		else 
			if current_user.subscriptions.exists?(friend_id: @user.id)
				@subscription = current_user.subscriptions.find_by_friend_id(@user.id)
				@subscription.destroy
				redirect_to profile_path(@user), notice: "Вы отписались на данного пользователя"
			else
				redirect_to profile_path(@user), notice: "Вы не были подписаны на данного пользователя"
			end
		end
	end
	
	def set_user
		@user = User.find(params[:id])
	end
end

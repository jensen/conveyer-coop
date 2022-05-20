class SessionsController < ApplicationController
  def new
  end

  def create
    params = session_params
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      helpers.log_in user
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    helpers.log_out
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end

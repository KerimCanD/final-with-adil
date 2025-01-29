class Api::V1::UsersController < Api::V1::ApiController
  # skip_before_action :authenticate_user!, only: [:create]

  # def create
  #  @user = User.new(user_params)
  #  if @user.save
  #    render json: @user, status: :created
  #  else
  #    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  #  end
  # end

  def show
    if @user
      render json: @user, status: :ok
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end

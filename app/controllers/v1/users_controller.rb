class V1::UsersController < V1::BaseController
  include BaseCrud

  private
  def user_params
    params.require(:user).permit(
        :role,
        :name,
        :email,
        :password,
        :mobile_number
    )
  end

  def users_scope
    User.all
  end
end

class V1::Auth::SessionController < ApplicationController
  include AuthAction

  # POST /v1/admin/auth
  def create
    auth_handler(User.active)
  end


  private
  def auth_handler(scope)
    # required params must be there
    assert_required_params params, [:username, :password]
    user = scope.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      render_login(user)
    else
      render_error message: "Invalid credential", status: :unauthorized
    end
  end

end

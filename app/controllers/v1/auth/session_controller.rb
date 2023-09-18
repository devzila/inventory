class V1::Auth::SessionController < ApplicationController
  include AuthRenderer
  # POST /v1/auth
  def create
    auth_handler(User.active)
  end


  private
  def auth_handler(scope)
    # required params must be there
    assert_required_params params, [:email, :password]
    user = scope.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id, entity: user.class.to_s)
      if params[:device_token].present?
        user.device_tokens.upsert({ device_token: params[:device_token], auth_token: token })
      end
      render_login(user, token)
    else
      render_error message: "Invalid credential", status: :unauthorized
    end
  end

end

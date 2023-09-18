module AuthRenderer

  def render_login(user, token)
    render_success message: 'Login successful', data: {
      token: token,
      exp: 360.days.from_now,
      object: user.as_api_response(:show)
    }, status: :ok

  end
end

module AuthRenderer

  def render_login(user)
    render_success message: 'Login successful', data: {
        token: JsonWebToken.encode(user_id: user.id, entity: user.class.to_s),
        exp: 360.days.from_now,
        object: user.as_api_response(:show)
    }, status: :ok

  end
end

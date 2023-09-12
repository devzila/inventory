class V1::Admin::Auth::WhoamiController < V1::Admin::BaseController

  def index
    render json: { user: current_user }
  end

end

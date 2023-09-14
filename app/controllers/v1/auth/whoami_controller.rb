class V1::Auth::WhoamiController < V1::BaseController

  def index
    render json: { user: current_user }
  end

end

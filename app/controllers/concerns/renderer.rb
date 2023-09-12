module Renderer
  extend ActiveSupport::Concern

  # Common method to render success response inside this module
  def render_success message: nil, data: nil, status: :ok
    render json: { success: true, message: message, data: data }, status: status
  end

  # Common method to render error response inside this module
  def render_error message: 'Unable to process this request',  data: nil, status: :bad_request
    render json: { success: false, message: message, data: data}, status: status
  end


end

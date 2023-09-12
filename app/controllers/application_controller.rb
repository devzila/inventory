class ApplicationController < ActionController::API
  include Renderer
  include ExceptionHandler
  include ActionController::MimeResponds
  include ActionController::ImplicitRender


  protected

  # This method to inform user if there were missing required parameters
  def assert_required_params params, required_params
    missing_params = []
    required_params.each do |p|
      missing_params << p if params[p].blank?
    end

    raise MissingParams.new(missing_params) if missing_params.any?
  end
end

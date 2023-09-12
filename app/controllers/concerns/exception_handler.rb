module ExceptionHandler
  extend  ActiveSupport::Concern

  include Renderer

  included do

    # Handle Rails 404 Not Found error with custom JSON response
    rescue_from ActiveRecord::RecordNotFound do
      render_error message: 'Record Not found', status: :not_found
    end

    # Handle Rails Bad Request error with custom JSON response
    rescue_from ActionController::ParameterMissing do
      render_error message: 'Missing parameter', status: :bad_request
    end

    # Handle Foreign key validation error with custom JSON response
    rescue_from ActiveRecord::InvalidForeignKey do
      render_error message: 'Invalid foreign key', status: :bad_request
    end

    # Handle Missing required params error with custom JSON response
    rescue_from MissingParams do |e|
      render_error message: e.message, status: :not_acceptable
    end
  end
end

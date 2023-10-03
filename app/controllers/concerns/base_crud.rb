# frozen_string_literal: true
module BaseCrud
  extend ActiveSupport::Concern
  DEFAULT_RECORD_PER_PAGE = 10

  included do
    before_action :set_scope
    before_action :set_resource, only: %i[show update destroy]
  end
  

  def index
    collections = collection
    render_success data: {
        collection_name => collections.as_api_response(index_template),
        pagination: pagination(collections)

    }, status: :ok
  end


  def show
    render_success data: {
        resource_name => @resource.as_api_response(show_template)
    }, status: :ok
  end


  def create
    resource = create_resource.new(resource_params)
    if resource.save
      render_success message: "#{resource_name} has been created successfully", data: {
          resource_name => resource.as_api_response(show_template)
      }, status: :created
    else
      render_error message: resource.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end


  def update
    if @resource.update(resource_params)
      render_success message: "#{resource_name} has been updated successfully", data: {
          resource_name => @resource.as_api_response(show_template)
      }, status: :ok
    else
      render_error message: @resource.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end


  def destroy
    if @resource.destroy
      render_success message: "#{resource_name} has been deleted successfully", data: {
          resource_name => @resource.as_api_response(:base)
      }, status: :ok
    else
      render_error message: @resource.errors.full_messages.join(', '), status: :unprocessable_entity
    end
  end

  protected

  # can be overwritten in controller to define own create resource
  def create_resource
    @scope
  end

  def set_scope
    @scope ||= send(controller_name + '_scope')
  end

  def show_template
    :show
  end

  def index_template
    :index
  end
  
  private

  def collection
    @collection ||= build_collection
  end

  def resource_name
    controller_name.singularize
  end

  def collection_name
    resource_name.to_s.pluralize.to_sym
  end

  def resource_params
    send("#{resource_name}_params")
  end


  def set_resource
    @resource ||= @scope.find(params[:id])
  end

  def resource_params
    send("#{resource_name}_params")
  end

  def build_collection(object = nil)
    result = (object || @scope)
    result = result.ransack(search_params).result           if search_params.present?
    result = result.page(params[:page] || 1).per(params[:limit] || DEFAULT_RECORD_PER_PAGE) if params[:limit] != '-1'
    result = result.order(collection_order)                 if collection_order.present?
    result
  end

  def collection_order
    { created_at: :desc }
  end

  def search_params
    params[:q]
  end

  def pagination(collection)
    {
        current_page:  collection&.current_page || 1,
        next_page:     collection&.next_page,
        previous_page: collection&.prev_page,
        total_pages:   collection&.total_pages || 1,
        per_page:      collection&.limit_value,
        total_entries: collection&.total_count
    }
  end

end

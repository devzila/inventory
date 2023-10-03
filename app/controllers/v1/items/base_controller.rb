class V1::Items::BaseController < V1::BaseController
  before_action :set_item

  def set_item
		id = params[:item_id].present? ? params[:item_id] : params[:id]
    @item = Item.find_by(id: id)
	end

end

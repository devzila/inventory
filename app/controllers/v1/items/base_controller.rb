class V1::Items::BaseController < V1::BaseController
  before_action :set_item

  def set_item
    @item = Item.find(params[:item_id])
	end

end

class V1::ItemsController < V1::BaseController
  include BaseCrud

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params.except(:quantity))
      render json: {message: "Successfully updated", item: @item}
    else
      render json: {message: @item.errors}
    end
  end

  private
  def item_params
    params.require(:item).permit(
        :name,
        :description,
        :item_type,
        :quantity,
        :alert_quantity
    )
  end


  def items_scope
    Item.all
  end
end

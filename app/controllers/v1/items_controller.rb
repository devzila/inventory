class V1::ItemsController < V1::BaseController
  include BaseCrud

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

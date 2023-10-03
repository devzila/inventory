class V1::Items::TransactionsController < V1::Items::BaseController
  include BaseCrud

  def create
    @previous_quantity = @item.quantity
    if params[:transaction_type]
      if params[:transaction_type] == "received"
        @new_quantity = @previous_quantity + params[:quantity]
      elsif params[:transaction_type] == "issued"
        @new_quantity = @previous_quantity - params[:quantity]
      end
      @item.update!(quantity: @new_quantity)
      @item.create_transaction(params[:quantity], current_user)
      render json: { message: 'Successfully updated the Quantity', transaction: @item.item_transactions}, status: 200
    else
      render json: { message: 'Error while updating Quantity' }, status: 402
    end
  end


  private

  def item_transactions_scope
    ItemTransaction.all
  end

  def item_transactions_params
    params.permit(
      :quantity,
      :transaction_type
    )
  end
end

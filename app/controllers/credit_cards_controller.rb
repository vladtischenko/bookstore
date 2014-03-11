class CreditCardsController < ApplicationController
  def create
    @credit_card = CreditCard.new(credit_card_params)
    if @credit_card.save
      redirect_to checkout_confirm_path
    else
      redirect_to checkout_payment_path, notice: "CreaditCard is not saved"
    end
  end

  def update
    @credit_card = CreditCard.find(params[:id])

    if @credit_card.update(credit_card_params)
      redirect_to checkout_confirm_path
    else
      redirect_to checkout_payment_path, notice: "CreaditCard is not saved"
    end
  end

  private
    def credit_card_params
      params.require(:credit_card).permit(:user_id, :code, :expiration_year,
                                          :expiration_month, :card_number)
    end
end

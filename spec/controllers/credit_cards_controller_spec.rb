require 'spec_helper'

describe CreditCardsController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user

    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  let(:credit_card) { FactoryGirl.create :credit_card, user: @user }
  let(:credit_card_params) {{"card_number"=>credit_card.card_number,
                            "expiration_month"=>credit_card.expiration_month,
                            "expiration_year"=>credit_card.expiration_year,
                            "code"=>credit_card.code, "user_id"=>credit_card.user}}

  context "POST create" do
    it "redirect_to checkout_confirm_path if credit_card was created" do
      @ability.can :create, CreditCard
      post :create, id: credit_card.id, credit_card: credit_card_params
      expect(response).to redirect_to checkout_confirm_path 
    end
    it "redirect_to checkout_payment_path and flash field notice if credit_card wasn't created" do
      @ability.can :create, CreditCard
      credit_card.code = ""
      post :create, id: credit_card.id, credit_card: credit_card_params
      expect(response).to redirect_to checkout_payment_path
      expect(flash[:notice]).to eq "CreditCard wasn't saved"
    end
  end

  context "PATCH update" do
    it "redirect_to checkout_confirm_path if credit_card was updated" do
      @ability.can :update, CreditCard
      patch :update, id: credit_card.id, credit_card: credit_card_params
      expect(response).to redirect_to checkout_confirm_path
    end
    it "redirect_to checkout_payment_path and flash field notice if credit_card wasn't updated" do
      @ability.can :update, CreditCard
      credit_card.code = ""
      patch :update, id: credit_card.id, credit_card: credit_card_params
      expect(response).to redirect_to checkout_payment_path
      expect(flash[:notice]).to eq "CreditCard wasn't saved"
    end
  end
end

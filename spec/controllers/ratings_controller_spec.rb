require 'spec_helper'

describe RatingsController do
  include Devise::TestHelpers

  before do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  let(:book) { FactoryGirl.create :book }
  
  context "Not authorized user" do
    it "cannot create rating" do
      @ability.cannot :create, Rating
    end
  end

  context "Authorized user" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      sign_in @user
    end

    let!(:rating) { FactoryGirl.create :rating, book: book, user: @user }
    let(:rating_params) {{"title" => rating.title, "text" => rating.text, "rate" => rating.rate.to_s}}

    context "GET new" do
      before do
        Book.stub(:find).and_return(book)
      end
      it "renders new template" do
        @ability.can :new, Rating
        get :new
        expect(response).to render_template :new
      end
    end

    context "POST create" do
      before do
        Rating.stub(:new).with(rating_params).and_return(rating)
        @ability.can :create, Rating
      end
      it "redirect_to book_path if rating created" do
        post :create, id: rating.id, rating: rating_params
        expect(response).to redirect_to book_path(book)
      end
      it "redirect_to new_book_rating_path if rating is't saved" do
        rating.rate = nil
        post :create, id: rating.id, rating: rating_params
        expect(response).to redirect_to new_book_rating_path(book)
      end
    end
  end
end

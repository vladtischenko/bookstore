require 'spec_helper'

describe RatingsController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user
  end

  let(:book) { FactoryGirl.create :book }
  let!(:rating) { FactoryGirl.create :rating, book: book, user: @user }
  let(:rating_params) {{"title" => rating.title, "text" => rating.text, "rate" => rating.rate.to_s}}

  context "GET new" do
    before do
      Book.stub(:find).and_return(book)
    end
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  context "POST create" do
    before do
      Rating.stub(:new).with(rating_params).and_return(rating)
    end
    it "redirect_to book_path if rating created" do
      post :create, id: rating.id, rating: rating_params
      expect(response).to redirect_to book_path(book)
    end
  end
end

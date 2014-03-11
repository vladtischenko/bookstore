require 'spec_helper'

describe BooksController do
  let(:book) { FactoryGirl.create :book }
  let(:book_params) {{"title"=>book.title, "short_description"=>book.short_description,
                      "description"=>book.description, "picture"=>book.picture,
                      "in_stock"=>book.in_stock, "price"=>book.price}}

  before do
    books = FactoryGirl.create_list :book, 5
    Book.stub(:news_five).and_return(books)
  end 

  context "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  context "GET show" do
    it "renders show template" do
      get :show, id: book.id, book: book_params
      expect(response).to render_template :show
    end 
    it "assigns book" do
      get :show, id: book.id
      expect(assigns(:book)).to eq book
    end
  end

  context "GET news" do
    it "renders news template" do
      get :news
      expect(response).to render_template :news
    end
    it "books count is one" do
      get :news
      expect(assigns(:books).count).to eq 1
    end
  end

  context "GET get_by_category" do
    before do
      @category = FactoryGirl.create :category
    end
    it "renders categories/index template" do
      get :get_by_category, category_id: @category
      expect(response).to render_template 'categories/index'
    end
    it "books count is not more nine" do
      get :get_by_category, category_id: @category
      expect(assigns(:books).count).to be < 9
    end
  end
end

require 'spec_helper'

describe Book do
  let(:book) { FactoryGirl.create :book }

  it { expect(book).to validate_presence_of :title }
  it { expect(book).to validate_presence_of :short_description }
  it { expect(book).to validate_presence_of :description }
  it { expect(book).to validate_presence_of :price }
  it { expect(book).to validate_numericality_of :price }

  context "relations" do
    it { expect(book).to have_many :ratings }
    it { expect(book).to belong_to :category }
    it { expect(book).to belong_to :author }
  end


  context "scopes" do
    before do
      @category = FactoryGirl.create :category
      @books = FactoryGirl.create_list :book, 5
      @books.each do |b|
        b.category = @category
        b.save
      end
    end

    it "return books by category" do
      expect(Book.category(@category)).to match_array(@books)
    end
    it "doesn't return books if they don't have passed category" do
      books = FactoryGirl.create_list :book, 5
      expect(Book.category(@category)).not_to match_array(books)
    end
  end

  context "methods" do
    before do
      @books = FactoryGirl.create_list :book, 5
    end

    it "return most news five books" do
      expect(Book.news_five).to match_array(@books)
    end
    it "news_five return five books" do
      books = FactoryGirl.create_list :book, 10
      expect(Book.news_five).not_to match_array(books)
    end
    it "return exactly five books" do
      books = FactoryGirl.create_list :book, 10
      expect(Book.news_five.count).to eq 5
    end
  end
end

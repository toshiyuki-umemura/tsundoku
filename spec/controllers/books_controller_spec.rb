require 'rails_helper'

describe BooksController, type: :controller do

  let(:user) { create(:user) }
  let(:book) { create(:book, user: user) }

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested book to @book" do
      get :edit, params: { id: book }
      expect(assigns(:book)).to eq book
    end

    it "renders the :edit template" do
      get :edit, params: { id: book }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of books ordered by created_at DESC" do
      books = create_list(:book, 3, user: user)
      get :index
      expect(assigns(:books)).to match(books.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
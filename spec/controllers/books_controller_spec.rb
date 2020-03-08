require 'rails_helper'

describe BooksController, type: :controller do

  let(:user) { create(:user) }
  let(:book) { create(:book, user: user) }
  let(:books) { create_list(:book, 3, user: user) }

  describe 'GET #new' do
    before { get :new }

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns new @book' do
      expect(assigns(:book)).to be_a_new Book
    end
  end


  describe 'GET #edit' do
    before { get :edit, params: { id: book } }

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "assigns the requested book to @book" do
      expect(assigns(:book)).to eq book
    end
  end


  describe 'GET #index' do
    before { get :index }

    it "renders the :index template" do
      expect(response).to render_template :index
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @books' do
      expect(assigns(:books)).to match_array books
    end

    it "populates an array of books ordered by created_at DESC" do
      expect(assigns(:books)).to match(books.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end


  describe 'GET #show' do
    before { get :show, params: { id: book } }

    it "renders the :show template" do
      expect(response).to render_template :show
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "assigns the requested book to @book" do
      expect(assigns(:book)).to eq book
    end
  end


  describe 'POST #create' do
    before do
      login user
    end

    let(:book_attributes) { attributes_for(:book) }

    it 'saves new book' do
      expect do
        post :create, params: { book: book_attributes }
      end.to change(Book, :count).by(1)
    end
  
    it 'redirects the :create template' do
      post :create, params: { book: book_attributes }
      expect(response).to redirect_to(root_path)
    end
  end


  describe 'PATCH #update' do
    before do
      login user
    end

    let(:update_attributes) do
      {
          title: 'update title',
          content: 'update content'
      }
    end
  
    it 'saves updated book' do
      expect do
        patch :update, params: { id: book.id, book: update_attributes }
      end.to change(Book, :count).by(1)
    end
  
    it 'updates updated book' do
      patch :update, params: { id: book.id, book: update_attributes }
      book.reload
      expect(book.title).to eq update_attributes[:title]
      expect(book.content).to eq update_attributes[:content]
    end
  
    it 'redirects the :create template' do
      patch :update, params: { id: book.id, book: update_attributes }
      expect(response).to redirect_to(root_path)
    end
  end

end
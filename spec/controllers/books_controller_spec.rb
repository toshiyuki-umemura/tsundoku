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

end
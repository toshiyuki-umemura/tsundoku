require 'rails_helper'

describe TagsController, type: :controller do

  let(:user) { create(:user) }
  let(:book) { create(:book, user: user) }
  let(:books) { create_list(:book, 3, user: user) }
  let(:tag) { create(:tag, book_id: book) }
  let(:tags) { create_list(:tag, 3, book_id: book) }

  describe 'GET #show' do
    before { get :show, params: { id: book } }

    it "renders the :show template" do
      expect(response).to render_template :show
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  end

end
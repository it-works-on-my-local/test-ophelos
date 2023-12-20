# spec/controllers/income_expenditures_controller_spec.rb
require 'rails_helper'

RSpec.describe IncomeExpendituresController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { FactoryBot.create(:user) }

  describe 'Authorized Access' do
    before do
      sign_in user
    end

    describe 'GET #new' do
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
        expect(assigns(:ie_statement)).to be_a_new(IncomeExpenditure)
      end
    end

    describe 'POST #create' do
      context 'with valid parameters' do
        it 'creates a new I&E statement' do
          expect do
            post :create, params: { income_expenditure: FactoryBot.attributes_for(:income_expenditure) }
          end.to change(IncomeExpenditure, :count).by(1)

          expect(response).to redirect_to(income_expenditure_path(assigns(:ie_statement)))
          expect(flash[:notice]).to be_present
        end
      end

      context 'with invalid parameters' do
        it 'renders the new template' do
          post :create, params: { income_expenditure: FactoryBot.attributes_for(:income_expenditure, person_name: nil) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PATCH #update' do
      let(:ie_statement) { FactoryBot.create(:income_expenditure, user: user) }

      context 'with valid parameters' do
        it 'updates the I&E statement' do
          patch :update, params: { id: ie_statement.id, income_expenditure: { person_name: 'Updated Name' } }
          ie_statement.reload
          expect(ie_statement.person_name).to eq('Updated Name')
          expect(response).to redirect_to(ie_statement)
          expect(flash[:notice]).to be_present
        end
      end

      context 'with invalid parameters' do
        it 'renders the edit template' do
          patch :update, params: { id: ie_statement.id, income_expenditure: { person_name: nil } }
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
        expect(assigns(:ie_statements)).to eq(IncomeExpenditure.all)
      end
    end
  end

  describe 'Unauthorized Access' do
    it 'redirects to sign-in page for new' do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'redirects to sign-in page for create' do
      post :create, params: { income_expenditure: FactoryBot.attributes_for(:income_expenditure) }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

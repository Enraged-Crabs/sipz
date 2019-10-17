require 'rails_helper'

RSpec.describe SipzController, type: :controller do
    describe "sipz#index action" do
        it "should successfully show the page" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe "sipz#new action" do
        it "should require users to be logged in" do
            get :new
            expect(response).to redirect_to new_user_session_path
        end

        it "should successfully show the new form" do
            user = FactoryBot.create(:user)
            sign_in user
      
            get :new
            expect(response).to have_http_status(:success)
          end
        end

    describe "sipz#new action" do

        it "should require users to be logged in" do
            post :create, params: { sip: { message: "Hello" } }
            expect(response).to redirect_to new_user_session_path
          end

        it "should successfully create a new sipz in our database" do
            user = FactoryBot.create(:user)
            sign_in user
            
            post :create, params: { sip: { message: 'Pour me a cold one!'}}
            expect(response).to redirect_to root_path

            sip = Sip.last
            expect(sip.message).to eq("Pour me a cold one!")
            expect(sip.user).to eq(user)
        end

        it "should properly deal with validation errors" do
            user = FactoryBot.create(:user)
            sign_in user
            
            sip_count = Sip.count  
            post :create, params: { sip: {message: ''}}
            expect(response).to have_http_status(:unprocessable_entity)
            expect(Sip.count).to eq 0
        end
    end
end

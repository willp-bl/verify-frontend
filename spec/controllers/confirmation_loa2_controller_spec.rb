require 'rails_helper'
require 'controller_helper'
require 'spec_helper'
require 'models/display/viewable_identity_provider'

describe ConfirmationLoa2Controller do
  subject { get :index, params: { locale: 'en' } }

  context 'user has selected an idp' do
    before(:each) do
      session[:selected_idp] = { 'entity_id' => 'http://idcorp.com', 'simple_id' => 'stub-idp-one', 'levels_of_assurance' => %w(LEVEL_1 LEVEL_2) }
    end

    it 'reports sign-in outcome to piwik' do
      set_session_and_cookies_with_loa('LEVEL_2')
      id_corp_name = "idcorp"

      session[:selected_idp_name] = id_corp_name
      session[:user_segments] = ['test-segment']
      session[:transaction_simple_id] = 'test-rp'
      session[:attempt_number] = '1'
      session[:journey_type] = 'sign-in'

      expect(FEDERATION_REPORTER).to receive(:report_user_idp_outcome)
       .with(current_transaction: a_kind_of(Display::RpDisplayData),
         request: a_kind_of(ActionDispatch::Request),
         idp_name: id_corp_name,
         user_segments: ['test-segment'],
         transaction_simple_id: 'test-rp',
         attempt_number: '1',
         journey_type: 'sign-in',
         response_status: 'success')
      subject { get :index, params: { locale: 'en' } }
    end

    it 'renders the confirmation LOA2 template when LEVEL_2 is the requested LOA' do
      set_session_and_cookies_with_loa('LEVEL_2')
      expect(subject).to render_template(:confirmation_LOA2)
    end
  end

  context 'user has no selected IDP in session' do
    it 'should raise a WarningLevelError' do
      set_session_and_cookies_with_loa('LEVEL_2')
      expect(Rails.logger).to receive(:warn).with(kind_of(Errors::WarningLevelError)).once
      get :index, params: { locale: 'en' }
      expect(response).to have_http_status(500)
    end
  end
end

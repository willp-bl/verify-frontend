require 'rails_helper'
require 'controller_helper'
require 'spec_helper'
require 'api_test_helper'

describe FailedSignInController do
  before(:each) do
    session[:selected_idp] = { 'entity_id' => 'http://idcorp.com', 'simple_id' => 'stub-idp-one', 'levels_of_assurance' => %w(LEVEL_1 LEVEL_2) }
    set_session_and_cookies_with_loa('LEVEL_2')
    session[:selected_idp_was_recommended] = true
  end

  subject { get :index, params: { locale: 'en' } }

  it 'reports registration outcome to piwik' do
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
       response_status: 'failure')
    subject
  end
end

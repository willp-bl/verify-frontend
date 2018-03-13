require 'rails_helper'
require 'controller_helper'
require 'spec_helper'

describe ChooseACountryController do
  let(:policy_proxy) { double(:policy_proxy) }

  context 'The policy proxy raises an Exception' do
    subject { get :choose_a_country, params: { locale: 'en' } }

    before(:each) do
      set_session_and_cookies_with_loa('LEVEL_2')
      session[:transaction_supports_eidas] = true
      stub_const('POLICY_PROXY', policy_proxy)
      allow(policy_proxy).to receive(:get_countries).and_raise(Exception)
    end

    it 'should render "Something went wrong"' do
      expect(subject).to render_template(:something_went_wrong)
      expect(response).to have_http_status(500)
    end
  end
end

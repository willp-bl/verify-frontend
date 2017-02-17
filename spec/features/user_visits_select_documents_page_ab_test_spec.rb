require 'feature_helper'
require 'api_test_helper'

RSpec.feature 'When B group user visits document selection page' do
  before(:each) do
    set_session_and_session_cookies!
    cookie_hash = create_cookie_hash.merge!(ab_test: CGI.escape({ 'split_questions' => 'split_questions_variant' }.to_json))
    set_cookies!(cookie_hash)
    visit '/select-documents'
  end

  it 'should have a header about photo identity documents' do
    expect(page).to have_content('Your photo identity document')
  end

  it 'should have a header about photo identity documents in Welsh if user selects Welsh' do
    visit '/dewis-dogfennau'
    expect(page).to have_content('Eich dogfennau hunaniaeth gyda llun')
  end

  it 'will report to piwki' do
    piwik_request = {
        '_cvar' => '{"6":["AB_TEST","split_questions_variant"]}'
    }
    expect(a_request(:get, INTERNAL_PIWIK.url).with(query: hash_including(piwik_request))).to have_been_made.once
  end

  context 'user has a valid GB licence or UK passport' do

    it 'should go to select phone page when user selects yes for GB driving licence' do
      choose 'photo_documents_form_any_driving_licence_true'
      choose 'photo_documents_form_driving_licence_true'
      choose 'photo_documents_form_passport_false'
      click_button 'Continue'
      expect(page).to have_current_path(select_phone_path)
      expect(page.get_rack_session['selected_answers']).to eql('documents' => { 'passport' => false, 'driving_licence' => true })
    end

    it 'should go to select phone page when user selects yes for UK passport' do
      choose 'photo_documents_form_any_driving_licence_false'
      choose 'photo_documents_form_passport_true'
      click_button 'Continue'
      expect(page).to have_current_path(select_phone_path)
      expect(page.get_rack_session['selected_answers']).to eql('documents' => { 'passport' => true, 'driving_licence' => false, 'ni_driving_licence' => false })
    end

    it 'should go to select phone page when user selects yes for GB driving licence and passport' do
      choose 'photo_documents_form_any_driving_licence_true'
      choose 'photo_documents_form_driving_licence_true'
      choose 'photo_documents_form_passport_true'
      click_button 'Continue'
      expect(page).to have_current_path(select_phone_path)
      expect(page.get_rack_session['selected_answers']).to eql('documents' => { 'passport' => true, 'driving_licence' => true })
    end
  end

  context 'user does not have UK driving license or valid passport' do

    it 'should go to other documents page if user clicks I dont have either of these documents link' do
      click_link 'I don\'t have either of these documents'
      expect(page.get_rack_session['selected_answers']).to eql('documents' => { 'passport' => false, 'driving_licence' => false,  'ni_driving_licence' => false})
      expect(page).to have_current_path(other_documents_path)
    end

    it 'should go to other documents page if user just has Northern Ireland driving license' do
      choose 'photo_documents_form_any_driving_licence_true'
      choose 'photo_documents_form_ni_driving_licence_true'
      choose 'photo_documents_form_passport_false'
      click_button 'Continue'
      expect(page.get_rack_session['selected_answers']).to eql('documents' => { 'passport' => false, 'ni_driving_licence' => true })
      expect(page).to have_current_path(other_documents_path)
    end

    it 'should go to other documents page if user does not have UK driving licence or UK passport' do
      choose 'photo_documents_form_any_driving_licence_false'
      choose 'photo_documents_form_passport_false'
      click_button 'Continue'
      expect(page.get_rack_session['selected_answers']).to eql('documents' => {  'passport' => false, 'driving_licence' => false, 'ni_driving_licence' => false })
      expect(page).to have_current_path(other_documents_path)
    end

  end
end

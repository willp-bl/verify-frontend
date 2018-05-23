# HUB-153 - Spike code, pending the JS side of it and decision whether to take this forward
require 'partials/journey_hinting_partial_controller'

class HintController < ApplicationController
  include JourneyHintingPartialController
  skip_before_action :validate_session
  skip_before_action :set_piwik_custom_variables

  def ajax_request
    set_headers

    entity_id = entity_id_of_journey_hint_for('SUCCESS')

    if !entity_id.nil?
      object = { 'status': 'OK', 'value': false }
    else
      text = I18n.translate('hint.text', locale: locale)
      object = { 'status': 'OK', 'value': true, 'text': text }
    end

    render json: object
  end

private

  def set_headers
    response.headers['Access-Control-Allow-Origin'] = 'https://www.gov.uk'
    response.headers['Access-Control-Request-Method'] = 'GET'
  end

  def locale 
    if params['lang'] == 'cy' 
      'cy'
    else
      'en'
    end
  end
end

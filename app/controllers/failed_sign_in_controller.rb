class FailedSignInController < ApplicationController
  def index
    report_user_idp_outcome_to_piwik
    @idp = IDENTITY_PROVIDER_DISPLAY_DECORATOR.decorate(selected_identity_provider)
  end

private

  def report_user_idp_outcome_to_piwik
    FEDERATION_REPORTER.report_user_idp_outcome(
      current_transaction: current_transaction,
      request: request,
      idp_name: session[:selected_idp_name],
      user_segments: session[:user_segments],
      transaction_simple_id: session[:transaction_simple_id],
      attempt_number: session[:attempt_number],
      journey_type: session[:journey_type],
      response_status: 'failure'
    )
  end
end

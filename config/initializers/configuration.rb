require 'configuration'
CONFIG = Configuration.load! do
  option_string 'rp_display_locales', 'RP_DISPLAY_LOCALES'
  option_string 'idp_display_locales', 'IDP_DISPLAY_LOCALES'
  option_string 'session_cookie_duration', 'SESSION_COOKIE_DURATION_IN_HOURS'
  option_string 'api_host', 'API_HOST'
  option_string 'logo_directory', 'LOGO_DIRECTORY'
  option_string 'zdd_file', 'ZDD_LATCH'
  option_string 'polling_wait_time', 'POLLING_WAIT_TIME'
end
# require 'i18n/backend/active_record'

# Add additional paths to load for I18n
Rails.application.config.i18n.load_path += Dir[File.join(CONFIG.rp_display_locales, '*.yml').to_s]
Rails.application.config.i18n.load_path += Dir[File.join(CONFIG.idp_display_locales, '*.yml').to_s]
Rails.application.config.i18n.load_path += Dir[File.join(CONFIG.country_display_locales, '*.yml').to_s]
Rails.application.config.i18n.load_path += Dir[File.join(CONFIG.cycle_3_display_locales, '*.yml').to_s]

# Translation  = I18n::Backend::ActiveRecord::Translation
#
# if Translation.table_exists?
#   Rails.application.config.i18n.backend = I18n::Backend::ActiveRecord.new
#
#   I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Memoize)
#   I18n::Backend::Simple.send(:include, I18n::Backend::Memoize)
#   I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)
#
#   Rails.application.config.i18n.backend = I18n::Backend::Chain.new(I18n::Backend::Simple.new, Rails.application.config.i18n.backend)
# end
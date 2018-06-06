require 'i18n/backend/active_record'

Translation = I18n::Backend::ActiveRecord::Translation

if Translation.table_exists?
  # I18n.backend = I18n::Backend::ActiveRecord.new
  #
  # I18n.backend = I18n::Backend::Chain.new(I18n.backend, I18n::Backend::Simple.new)
end

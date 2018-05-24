require 'i18n/backend/active_record'

namespace :db do
  desc 'seed translations'
  task :seed_translations do

    Translation = I18n::Backend::ActiveRecord::Translation

    if Translation.table_exists?
      Translation.create(
          locale: "en",
          key: "rps.test-rp.name",
          value: "register for an identity profile"
      )

      Translation.create(
          locale: "en",
          key: "rps.test-rp.rp_name",
          value: "Test RP No Demo"
      )

      Translation.create(
          locale: "en",
          key: "rps.test-rp.analytics_description",
          value: "TEST RP NO DEMO"
      )

      Translation.create(
          locale: "en",
          key: "rps.test-rp.other_ways_description",
          value: "register for an identity profile"
      )

      Translation.create(
          locale: "en",
          key: "rps.headless-rp.other_ways_text",
          value: "whatever"
      )

      Translation.create(
          locale: "en",
          key: "rps.headless-rp.other_ways_text",
          value: "some other text for the headless rp"
      )

      Translation.create(
          locale: "en",
          key: "rps.test-rp.tailored_text",
          value: "<p>En This is tailored text for TEST RP NO DEMO</p>"
      )

      Translation.create(
          locale: "cy",
          key: "rps.test-rp.name",
          value: "register for an identity profile"
      )

      Translation.create(
          locale: "cy",
          key: "rps.test-rp.rp_name",
          value: "Test RP No Demo"
      )

      Translation.create(
          locale: "cy",
          key: "rps.test-rp.analytics_description",
          value: "TEST RP NO DEMO"
      )

      Translation.create(
          locale: "cy",
          key: "rps.test-rp.other_ways_description",
          value: "register for an identity profile"
      )

      Translation.create(
          locale: "cy",
          key: "rps.test-rp.tailored_text",
          value: "<p>Cy This is tailored text for TEST RP NO DEMO</p>"
      )
    end
  end
end
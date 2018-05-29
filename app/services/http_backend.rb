# module Services
  class HttpBackend
    def initialize(translator)
      @translator = translator
      # @translations = {
      #     "test-rp" => {
      #         "en" => {
      #             name: 'register for an identity profile',
      #             rp_name: 'Test RP',
      #             "analytics_description" => 'analytics description for test-rp',
      #             other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
      #             other_ways_description: 'register for an identity profile',
      #             tailored_text: '<p>This is tailored text for test-rp</p>',
      #             taxon_name: 'Benefits'
      #         },
      #         "cy" => {
      #             name: 'register for an identity profile',
      #             rp_name: 'Test RP',
      #             "analytics_description" => 'analytics description for test-rp',
      #             other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
      #             other_ways_description: 'register for an identity profile',
      #             tailored_text: '<p>Some other test text for TEST-RP, for locale CY</p>',
      #             taxon_name: 'Benefits'
      #         }
      #     }
      # }
    end

    def called_from_i18n
      # Get the data from a Hub API endpoint
      # @translations = {
      #   "test-rp" => {
      #     "en" => {
      #       name: 'register for an identity profile',
      #       rp_name: 'Test RP',
      #       "analytics_description" => 'analytics description for test-rp',
      #       other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
      #       other_ways_description: 'register for an identity profile',
      #       tailored_text: '<p>This is tailored text for test-rp</p>',
      #       taxon_name: 'Benefits'
      #     },
      #     "cy" => {
      #         name: 'register for an identity profile',
      #         rp_name: 'Test RP',
      #         "analytics_description" => 'analytics description for test-rp',
      #         other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
      #         other_ways_description: 'register for an identity profile',
      #         tailored_text: '<p>Some other test text for TEST-RP, for locale CY</p>',
      #         taxon_name: 'Benefits'
      #     }
      #   }
      # }

      I18n.backend.store_translations('en', {
          name: 'register for an identity profile',
          rp_name: 'Test RP',
          "analytics_description" => 'analytics description for test-rp',
          other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
          other_ways_description: 'register for an identity profile',
          tailored_text: '<p>This is tailored text for test-rp</p>',
          taxon_name: 'Benefits'
      })

      I18n.backend.store_translations('cy', {
          name: 'register for an identity profile',
          rp_name: 'Test RP',
          "analytics_description" => 'analytics description for test-rp',
          other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
          other_ways_description: 'register for an identity profile',
          tailored_text: '<p>Some other test text for TEST-RP, for locale CY</p>',
          taxon_name: 'Benefits'
      })

      @translations = {
          "test-rp" => Display::RpDisplayData.new('test-rp', @translator)
      }

      Rails.logger.error('------ Updating RP_DISPLAY_REPOSITORY ------')

      RP_DISPLAY_REPOSITORY.merge!(@translations)
    end
  end
# end
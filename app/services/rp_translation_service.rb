class RpTranslationService
  def initialize(translator)
    @translator = translator

    # These translations will be stored externally
    @translations = {
      "test-rp" => {
        en: {
            name: 'register for an identity profile',
            rp_name: 'Test RP',
            analytics_description: 'analytics description for test-rp',
            other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
            other_ways_description: 'register for an identity profile',
            tailored_text: '<p>This is tailored text for test-rp, for locale EN</p>',
            taxon_name: 'Benefits'
        },
        cy: {
            name: 'register for an identity profile',
            rp_name: 'Test RP',
            analytics_description: 'analytics description for test-rp',
            other_ways_text: '<p>If you can’t verify your identity using GOV.UK Verify, you can register for an identity profile <a href="http://www.example.com">here</a>.</p><p>Tell us your:</p><ul><li>name</li><li>age</li></ul><p>Include any other relevant details if you have them.</p>',
            other_ways_description: 'register for an identity profile',
            tailored_text: '<p>Some other text for TEST-RP, for locale CY</p>',
            taxon_name: 'Benefits'
        }
      }
    }
  end

  def update_rp_translations
    # Get transactions from external endpoint
    # This could use all translations to get a list of transactions,
    # depending on how the returned data is structured.
    transactions = get_transactions

    transactions.each do |transaction|
      all_translations = get_translations(transaction)

      # This is making the assumption that the returned data will be keyed by locale.
      all_translations.map do |locale, translations|
        I18n.backend.store_translations(locale, {
          rps: Hash[transaction, translations]
        })
      end
    end

    RP_DISPLAY_REPOSITORY.merge!({
      "test-rp" => Display::RpDisplayData.new('test-rp', @translator)
    })
  end

  private

  def get_transactions
    ['test-rp']
  end

  def get_translations(transaction)
    @translations.fetch(transaction)
  end
end
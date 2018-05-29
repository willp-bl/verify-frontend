module Display
  class RepositoryFactory
    def initialize(translator, rp_translation_service)
      @translator = translator
      @rp_translation_service = rp_translation_service
    end

    def create_idp_repository(directory)
      create_from_directory(Display::IdpDisplayData, directory)
    end

    def create_country_repository(directory)
      create_from_directory(Display::CountryDisplayData, directory)
    end

    def create_rp_repository
      transactions = @rp_translation_service.get_transactions

      create(Display::RpDisplayData, transactions)
    end

    def create_cycle_three_repository(directory)
      create_from_directory(Display::CycleThreeDisplayData, directory)
    end

  private

    def create(klass, simple_ids)
      display_data_collection = simple_ids.map do |simple_id|
        klass.new(simple_id, @translator)
      end

      # if validate && Rails.env.development?
      display_data_collection.each(&:validate_content!)
      # end

      display_data_collection.inject({}) do |hash, data|
        hash[data.simple_id] = data
        hash
      end
    end

    def create_from_directory(klass, directory)
      simple_ids = Dir[File.join(directory, "*.yml").to_s].map do |file|
        File.basename(file, ".yml")
      end

      create(klass, simple_ids)
    end
  end
end

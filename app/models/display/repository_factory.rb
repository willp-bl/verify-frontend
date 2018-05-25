module Display
  class RepositoryFactory
    def initialize(translator)
      @translator = translator
      ENV['LOADED_RPS'] = ''
    end

    def create_idp_repository(directory)
      create(directory, Display::IdpDisplayData)
    end

    def create_country_repository(directory)
      create(directory, Display::CountryDisplayData)
    end

    def create_rp_repository(directory)
      create(directory, Display::RpDisplayData, false, 'rb')
    end

    def create_cycle_three_repository(directory)
      create(directory, Display::CycleThreeDisplayData)
    end

  private

    def create(directory, klass, validate = true, filetype = 'yml')
      rps = Array.new
      display_data_collection = Dir[File.join(directory, "*.#{filetype}").to_s].map do |file|
        rps.push("Directory: #{directory}; Filetype: #{filetype}")

        klass.new(File.basename(file, ".#{filetype}"), @translator)
      end

      # ENV['LOADED_RPS'] = "#{ENV['LOADED_RPS']}, #{rps.to_s}"

      if validate && Rails.env.development?
        display_data_collection.each(&:validate_content!)
      end

      display_data_collection.inject({}) do |hash, data|
        hash[data.simple_id] = data
        hash
      end

      # ENV['LOADED_RPS'] = "#{display_data_collection.to_s}"

      # display_data_collection
    end
  end
end

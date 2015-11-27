module Coinprism

  # Configuration options for {Client}, defaulting to values
  # in {Default}
  module Configurable
    attr_accessor :access_token, :connection_options,
                  :per_page
    attr_writer :password, :api_endpoint, :login

    class << self

      # List of configurable keys for {Octokit::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :access_token,
          :connection_options,
          :login,
          :per_page,
          :password
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      Coinprism::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Coinprism::Default.options[key])
      end
      self
    end
    alias setup reset!

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    def api_endpoint
      File.join(@api_endpoint, "")
    end

    # Base URL for generated web URLs
    #
    # @return [String] Default: https://github.com/
    def web_endpoint
      File.join(@web_endpoint, "")
    end

    def login
      @login ||= begin
        user.login if token_authenticated?
      end
    end

    def netrc?
      !!@netrc
    end

    private

    def options
      Hash[Coinprism::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    def fetch_client_id_and_secret(overrides = {})
      opts = options.merge(overrides)
      opts.values_at :client_id, :client_secret
    end
  end
end

require 'rest-client'
require 'json'

require 'coinprism/version'
require 'coinprism/client'

module Coinprism
  class << self
    def client
      return @client if defined?(@client)
      @client = Coinprism::Client.new(options)
    end

    private

    def method_missing(method_name, *args, &block)
      if client.respond_to?(method_name)
        return client.send(method_name, *args, &block)
      end
      super
    end
  end
end

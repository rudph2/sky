module Sky
  module Adapters
    class SkyEndpointAdapter
      def initialize(dependencies)
        @url = dependencies[:url] || 'http://safe-plains-5453.herokuapp.com/bill.json'
        @default_adapter = dependencies[:default_adapter] || Faraday.default_adapter
        @faraday = dependencies[:faraday] || Faraday.new(@url)
      end

      def get_response_for(endpoint)
        @faraday.request  :url_encoded
        @faraday.response :logger
        @faraday.adapter  @default_adapter

        response = @faraday.get "/#{endpoint}"
        response.body
      end
    end
  end
end
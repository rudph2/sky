module Sky
  module Adapters
    class SkyEndpointAdapter
      def get_response_for(endpoint)
        conn = Faraday.new(:url => 'http://safe-plains-5453.herokuapp.com/bill.json') do |faraday|
          faraday.request  :url_encoded
          faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end

        response = conn.get "/#{endpoint}"
        response.body
      end
    end
  end
end
module Sky
  module ResourceProviders
    class SkyEndpointResourceProvider
      def initialize
        @sky_endpoint_adapter = ::Sky::Adapters::SkyEndpointAdapter.new
      end

      def get_bill
        result = @sky_endpoint_adapter.get_response_for("bill.json")

        JSON.parse( result, {:symbolize_names => true} )
      end
    end
  end
end

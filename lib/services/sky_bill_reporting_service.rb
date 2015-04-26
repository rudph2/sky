#require 'pry'
#require 'pry-debugger'

module Sky
  module Services
    class SkyBillReportingService
      def initialize
        @sky_endpoint_provider = ::Sky::ResourceProviders::SkyEndpointResourceProvider.new
      end

      def build_report
        bill = @sky_endpoint_provider.get_bill

        sky_bill_dto = ::Sky::Dto::SkyBill.new
        sky_bill_dto.bill_total = bill[:total]
        sky_bill_dto.buy_and_keep = bill[:skyStore][:buyAndKeep]
        sky_bill_dto.call_total = bill[:callCharges][:total]
        sky_bill_dto.calls = bill[:callCharges][:calls]
        sky_bill_dto.period_end = bill[:statement][:period][:to]
        sky_bill_dto.period_start = bill[:statement][:period][:from]
        sky_bill_dto.rentals = bill[:skyStore][:rentals]
        sky_bill_dto.skystore_total = bill[:skyStore][:total]
        sky_bill_dto.statement_due = bill[:statement][:generated]
        sky_bill_dto.statement_generated_date = bill[:statement][:generated]
        sky_bill_dto.subscriptions = bill[:package][:subscriptions]
        sky_bill_dto.subscription_total = bill[:package][:total]

        sky_bill_dto
      end
    end
  end
end
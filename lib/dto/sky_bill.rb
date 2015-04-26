module Sky
  module Dto
    class SkyBill
      attr_accessor :preamble, :statement_generated_date, :statement_due, :period_start, :period_end, :bill_total, :subscriptions,
                    :subscription_total, :calls, :call_total, :skystore, :skystore_total, :rentals, :buy_and_keep

    end
  end
end
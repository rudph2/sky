class Reports::SkyBillReportController < ApplicationController
  def index
    sky_bill_reporting_service = ::Sky::Services::SkyBillReportingService.new
    @report = sky_bill_reporting_service.build_report
  end
end

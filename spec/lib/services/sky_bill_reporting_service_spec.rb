require 'spec_helper'

describe ::Sky::Services::SkyBillReportingService do
  let(:endpoint_resource_provider) { double(:endpoint_resource_provider) }

  let(:parsed_customer_bill) { {total: 'total_foo',
                                skyStore: {buyAndKeep: ['buy_and_keep_foo'],
                                           rentals: ['some_rentals'],
                                           totals: 'sky_store_total'},
                                callCharges: {total: 'call_charges_total_foo',
                                              calls: ['some_call']},
                                statement: {period: {to: 'period_to_foo', from: 'period_from_foo'},
                                            generated: 'some_generated_date',
                                            due: 'statement_due_date'},
                                package: {subscriptions: ['some_subscription'],
                                          total: 'package_total'}} }

  subject { ::Sky::Services::SkyBillReportingService.new({:endpoint_resource_provider => endpoint_resource_provider}) }

  before :each do
    allow(endpoint_resource_provider).to receive(:get_bill).and_return(parsed_customer_bill)
  end

  it 'encapsulates bill_total' do
    expect(subject.build_report.bill_total).to eq parsed_customer_bill[:total]
  end

  it 'encapsulates buy_and_keep' do
    expect(subject.build_report.buy_and_keep).to eq parsed_customer_bill[:skyStore][:buyAndKeep]
  end

  it 'encapsulates call_total' do
    expect(subject.build_report.call_total).to eq parsed_customer_bill[:callCharges][:total]
  end

  it 'encapsulates calls' do
    expect(subject.build_report.calls).to eq parsed_customer_bill[:callCharges][:calls]
  end

  it 'encapsulates period_start' do
    expect(subject.build_report.period_start).to eq parsed_customer_bill[:statement][:period][:from]
  end

  it 'encapsulates period_end' do
    expect(subject.build_report.period_end).to eq parsed_customer_bill[:statement][:period][:to]
  end

  it 'encapsulates rentals' do
    expect(subject.build_report.rentals).to eq parsed_customer_bill[:skyStore][:rentals]
  end

  it 'encapsulates skyStore_total' do
    expect(subject.build_report.skystore_total).to eq parsed_customer_bill[:skyStore][:total]
  end

  it 'encapsulates statement_due' do
    expect(subject.build_report.statement_due).to eq parsed_customer_bill[:statement][:generated]
  end

  it 'encapsulates statement_generated_date' do
    expect(subject.build_report.statement_generated_date).to eq parsed_customer_bill[:statement][:generated]
  end

  it 'encapsulates subscriptions' do
    expect(subject.build_report.subscriptions).to eq parsed_customer_bill[:package][:subscriptions]
  end

  it 'encapsulates subscription_total' do
    expect(subject.build_report.subscription_total).to eq parsed_customer_bill[:package][:total]
  end
end
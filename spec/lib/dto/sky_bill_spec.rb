require 'spec_helper'

describe Sky::Dto::SkyBill do

  subject {Sky::Dto::SkyBill.new}

  it 'encapsulates field statement_generated_date' do
    subject.statement_generated_date = 'foo'
    expect(subject.statement_generated_date).to eq 'foo'
  end
  it 'encapsulates field statement_due' do
    subject.statement_due = 'foo'
    expect(subject.statement_due).to eq 'foo'
  end
  it 'encapsulates field period_start' do
    subject.period_start = 'foo'
    expect(subject.period_start).to eq 'foo'
  end
  it 'encapsulates field  period_end' do
    subject.period_start = 'foo'
    expect(subject.period_start).to eq 'foo'
  end
  it 'encapsulates field bill_total' do
    subject.bill_total = 'foo'
    expect(subject.bill_total).to eq 'foo'
  end
  it 'encapsulates field subscriptions' do
    subject.subscriptions = 'foo'
    expect(subject.subscriptions).to eq 'foo'
  end
  it 'encapsulates field subscription_total' do
    subject.subscription_total = 'foo'
    expect(subject.subscription_total).to eq 'foo'
  end
  it 'encapsulates field calls' do
    subject.calls = 'foo'
    expect(subject.calls).to eq 'foo'
  end
  it 'encapsulates field call_total' do
    subject.call_total = 'foo'
    expect(subject.call_total).to eq 'foo'
  end
  it 'encapsulates field skystore' do
    subject.skystore = 'foo'
    expect(subject.skystore).to eq 'foo'
  end
  it 'encapsulates field skystore_total' do
    subject.skystore_total = 'foo'
    expect(subject.skystore_total).to eq 'foo'
  end
  it 'encapsulates field rentals' do
    subject.rentals = 'foo'
    expect(subject.rentals).to eq 'foo'
  end
  it 'encapsulates field buy_and_keep' do
    subject.buy_and_keep = 'foo'
    expect(subject.buy_and_keep).to eq 'foo'
  end
end
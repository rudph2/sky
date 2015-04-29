require 'spec_helper'

describe ::Sky::ResourceProviders::SkyEndpointResourceProvider do

  let(:endpoint_adapter){double(:endpoint_adapter)}

  subject{::Sky::ResourceProviders::SkyEndpointResourceProvider.new({:endpoint_adapter => endpoint_adapter})}

  it 'returns correct json content' do
    allow(endpoint_adapter).to receive(:get_response_for).with('bill.json').and_return('{"some_key": "some_value"}')
    expect(subject.get_bill).to eq({:some_key => 'some_value'})
  end
end
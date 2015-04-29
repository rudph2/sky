require 'spec_helper'

describe Sky::Adapters::SkyEndpointAdapter do

  let(:faraday){double(:faraday)}
  let(:url){'test_url'}
  let(:default_adapter){'default_adapter'}
  let(:response){double(:response)}

  subject {Sky::Adapters::SkyEndpointAdapter.new(:faraday => faraday, :url => url, :default_adapter => default_adapter)}

  before :each do
    allow(faraday).to receive(:request).with(:url_encoded)
    allow(faraday).to receive(:response).with(:logger)
    allow(faraday).to receive(:adapter).with(default_adapter)
  end

  it 'gets the response for correct url' do
    allow(faraday).to receive(:get).with('/foo_endpoint').and_return(response)
    allow(response).to receive(:body).and_return('test_response')
    expect(subject.get_response_for('foo_endpoint')).to eq 'test_response'
  end
end
# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::AdfsOpenIdConnect do
  let(:request) { double('Request', params: {}, cookies: {}, env: {}) }
  let(:app) do
    lambda do
      [200, {}, ['Hello.']]
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe 'configuration' do
    let(:options) { @options || {} }

    subject do
      OmniAuth::Strategies::AdfsOpenIdConnect.new(
        app,
        { client_id: 'id', client_secret: 'secret', base_adfs_url: 'https://login.foo.com' }
        .merge(options)
      )
    end

    describe '#client' do
      it 'has correct authorize url' do
        allow(subject).to receive(:request) { request }
        expect(subject.client.options[:authorize_url]).to eql('https://login.foo.com/adfs/oauth2/authorize')
      end

      it 'has correct authorize params' do
        allow(subject).to receive(:request) { request }
        subject.client
        expect(subject.authorize_params[:domain_hint]).to be_nil
      end

      it 'has correct token url' do
        allow(subject).to receive(:request) { request }
        expect(subject.client.options[:token_url]).to eql('https://login.foo.com/adfs/oauth2/token')
      end
    end
  end
end

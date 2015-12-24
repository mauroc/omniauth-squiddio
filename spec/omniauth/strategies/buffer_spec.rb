require 'spec_helper'

describe OmniAuth::Strategies::Squiddio do
  subject do
    OmniAuth::Strategies::Squiddio.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("squiddio")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('http://squidd.io')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://squidd.io/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://squidd.io/oauth/token')
    end
  end
end

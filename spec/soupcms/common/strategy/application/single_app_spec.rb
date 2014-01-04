require 'spec_helper'
require 'rack/request'
require 'rack/mock'

describe SoupCMS::Common::Strategy::Application::SingleApp do

  before(:each) do
    SoupCMS::Common::Strategy::Application::SingleApp.configure do |config|
      config.app_name = 'soupcms-test'
      config.display_name = 'soupCMS Test'
      config.soupcms_api_url = 'http://example.com:8081/api/soupcms-test'
      config.app_base_url = 'http://example.com:8081/soupcms-test'
    end
  end

  let(:app_strategy) { SoupCMS::Common::Strategy::Application::SingleApp.new(Rack::Request.new(Rack::MockRequest.env_for('http://example.com:8080/posts/slug/my-first-blog-post?include=drafts'))) }

  it { expect(app_strategy.app_name).to eq('soupcms-test') }
  it { expect(app_strategy.display_name).to eq('soupCMS Test') }
  it { expect(app_strategy.path).to eq('posts/slug/my-first-blog-post') }
  it { expect(app_strategy.soupcms_api_url).to eq('http://example.com:8081/api/soupcms-test') }
  it { expect(app_strategy.app_base_url).to eq('http://example.com:8081/soupcms-test') }
  it { expect(app_strategy.not_found_message).to eq("Page 'posts/slug/my-first-blog-post' not found in application 'soupcms-test'") }

end
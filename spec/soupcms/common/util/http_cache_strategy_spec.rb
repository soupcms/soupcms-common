require 'spec_helper'

describe SoupCMS::Common::Util::HttpCacheStrategy do

  it 'should it should set cache header to default 5 min' do
    env = ENV['RACK_ENV']
    ENV['RACK_ENV'] = 'production'
    context = { 'model_name' => 'posts' }
    headers = SoupCMS::Common::Util::HttpCacheStrategy.new.headers(context)
    expect(headers.size).to eq(2)
    expect(headers['Cache-Control']).to eq('public, max-age=300')
    expect(headers['Expires']).not_to be_nil
    ENV['RACK_ENV'] = env
  end

  it 'should not set cache headers when requested for drafts' do
    env = ENV['RACK_ENV']
    ENV['RACK_ENV'] = 'production'
    context = { 'model_name' => 'posts', 'include' => 'drafts' }
    headers = SoupCMS::Common::Util::HttpCacheStrategy.new.headers(context)
    expect(headers.size).to eq(0)
    ENV['RACK_ENV'] = env
  end

  it 'should not set cache headers when RACK_ENV is not production' do
    env = ENV['RACK_ENV']
    ENV['RACK_ENV'] = 'test'
    context = { 'model_name' => 'posts', 'include' => 'drafts' }
    headers = SoupCMS::Common::Util::HttpCacheStrategy.new.headers(context)
    expect(headers.size).to eq(0)
    ENV['RACK_ENV'] = env
  end

  it 'should respect max age set' do
    env = ENV['RACK_ENV']
    ENV['RACK_ENV'] = 'production'
    context = { 'model_name' => 'posts' }
    SoupCMS::Common::Util::HttpCacheStrategy.default_max_age = 5000
    headers = SoupCMS::Common::Util::HttpCacheStrategy.new.headers(context)
    expect(headers.size).to eq(2)
    expect(headers['Cache-Control']).to eq('public, max-age=5000')
    expect(headers['Expires']).not_to be_nil
    SoupCMS::Common::Util::HttpCacheStrategy.default_max_age = SoupCMS::Common::Util::HttpCacheStrategy::DEFAULT_MAX_AGE
    ENV['RACK_ENV'] = env
  end

end
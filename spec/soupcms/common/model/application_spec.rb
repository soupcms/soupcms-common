require 'spec_helper'

describe SoupCMS::Common::Model::Application do

  it 'should default to localhost mongodb when not specified' do
    app = SoupCMS::Common::Model::Application.new('soupcms-test','soupCMS Test','http://localhost:9292/api/soupcms-test','http://localhost:9292/soupcms-test')
    expect(app.mongo_uri).to eq('mongodb://localhost:27017/soupcms-test')
  end
end
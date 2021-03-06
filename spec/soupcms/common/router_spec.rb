require 'spec_helper'

describe SoupCMS::Common::Router do

  context 'should match route requests' do

    class ModelController
    end

    class TagCloudController
    end

    class KeyValueController
    end

    class MultipleKeyValueController
    end

    let(:router) do
      router = SoupCMS::Common::Router.new
      router.add ':model_name', ModelController
      router.add ':model_name/tag-cloud', TagCloudController
      router.add ':model_name/:key/:value', KeyValueController
      router.default MultipleKeyValueController
      router
    end

    let(:params) { {} }

    it { expect(router.resolve('posts', params)).to eq(ModelController) }
    it { expect(router.resolve('posts/tag-cloud', params)).to eq(TagCloudController) }
    it { expect(router.resolve('posts/slug/my-first-blog-post', params)).to eq(KeyValueController) }
    it { expect(router.resolve('posts/version/slug/my-first-blog-post', params)).to eq(MultipleKeyValueController) }

    it 'should set params for keys in route path for ModelController' do
      router.resolve('posts', params)
      expect(params['model_name']).to eq('posts')
    end

    it 'should set params for keys in route path for TagCloudController' do
      router.resolve('posts/tag-cloud', params)
      expect(params['model_name']).to eq('posts')
    end

    it 'should set params for keys in route path for KeyValueController' do
      router.resolve('posts/slug/my-first-blog-post', params)
      expect(params['model_name']).to eq('posts')
      expect(params['key']).to eq('slug')
      expect(params['value']).to eq('my-first-blog-post')
    end

    it 'should set params for keys in route path for MultipleKeyValueController' do
      router.resolve('posts/version/slug/my-first-blog-post', params)
      expect(params['slug']).to eq('posts/version/slug/my-first-blog-post')
    end

    it 'should return nil when no default router is specified and not match found' do
      router = SoupCMS::Common::Router.new
      expect(router.resolve('posts/tag-cloud', params)).to be_nil
    end

  end
end
require 'spec_helper'

describe SoupCMS::Common::Util::EvalValue do

  context 'numbers' do
    it { expect(SoupCMS::Common::Util::EvalValue.new('1234').eval_value).to eq(1234) }
    it { expect(SoupCMS::Common::Util::EvalValue.new('239847329847').eval_value).to eq(239847329847) }
    it { expect(SoupCMS::Common::Util::EvalValue.new('4').eval_value).to eq(4) }
  end

  context 'string' do
    it { expect(SoupCMS::Common::Util::EvalValue.new('My first blog post').eval_value).to eq('My first blog post') }
  end

  context 'boolean' do
    it { expect(SoupCMS::Common::Util::EvalValue.new('true').eval_value).to eq(true) }
    it { expect(SoupCMS::Common::Util::EvalValue.new('false').eval_value).to eq(false) }
  end

  context 'matcher' do
    it { expect(SoupCMS::Common::Util::EvalValue.new('/^[\d]/').eval_value).to eq(/^[\d]/) }

  end



end
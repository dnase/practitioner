require 'spec_helper'
describe 'ordering' do
  context 'with default values for all parameters' do
    it { should contain_class('ordering') }
  end
end

require 'spec_helper'
describe 'open_iscsi' do

  context 'with defaults for all parameters' do
    it { should contain_class('open_iscsi') }
  end
end

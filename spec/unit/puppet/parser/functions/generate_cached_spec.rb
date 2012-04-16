require 'spec_helper'

describe Puppet::Parser::Functions.function(:generate_cached) do
  before :all do
    Puppet::Parser::Functions.autoloader.loadall
  end

  let(:scope) do
    scope = Puppet::Parser::Scope.new
  end

  subject do
    scope.method :generate_cached
  end

  it 'should exist' do
    Puppet::Parser::Functions.function('generate_cached').should == 'function_generate_cached'
  end

  it 'should return uncached output with ttl = 0' do
    result = scope.function_generate_cached(['/bin/date', '0'])
    # ensures the date output varies by at least a second
    sleep 1.1
    result.should_not(eq(scope.function_generate_cached(['/bin/date', '0'])))
  end

end

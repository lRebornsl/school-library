require 'rspec'
require_relative '../nameable'

describe Nameable do
  context 'testing the correct_name method' do
    it 'should raise a NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

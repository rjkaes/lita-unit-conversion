require 'spec_helper'

describe Lita::Extensions::UnitConversion, lita_handler: true do
  it { is_expected.to route_command('convert one pound into kg').to(:convert) }

  context 'with an unknown conversion' do
    it 'returns the conversion error' do
      send_command('convert 1 lbs into ml')
      expect(replies.last).to eq("I'm sorry, but I cannot convert `1 lbs` into `ml`.")
    end
  end

  context 'without numeric values' do
    it 'returns the conversion from pound to kilograms' do
      send_command('convert pound to kilogram')
      expect(replies.last).to eq('0.45 kg')
    end

    it 'returns the conversion from kilograms to pounds' do
      send_command('convert from kilograms into pounds')
      expect(replies.last).to eq('2.20 lbs')
    end
  end

  context 'temperatures' do
    it 'converts from degrees celsius into farenheit' do
      send_command('convert 10C into F')
      expect(replies.last).to eq('50.00°F')
    end

    it 'converts from degrees farenheit into celsius' do
      send_command('convert 212F into C')
      expect(replies.last).to eq('100.00°C')
    end
  end
end

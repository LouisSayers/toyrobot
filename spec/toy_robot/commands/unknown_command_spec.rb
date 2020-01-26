require 'spec_helper'

describe ToyRobot::UnknownCommand do
  let(:command) { described_class.new }

  describe '#execute' do
    let(:context) { instance_double(ToyRobot::Context) }

    subject { command.execute(context) }

    it 'logs a message' do
      allow(ToyRobot::Logger).to receive(:error)
      subject
      expect(ToyRobot::Logger).to have_received(:error).with('Unknown command')
    end
  end
end

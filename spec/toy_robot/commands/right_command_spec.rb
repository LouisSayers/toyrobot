require 'spec_helper'

describe ToyRobot::RightCommand do
  let(:command) { described_class.new }

  describe '#execute' do
    let(:robot) { instance_double(ToyRobot::Robot) }
    let(:context) { instance_double(ToyRobot::Context, robot: robot) }

    subject { command.execute(context) }

    before do
      allow(robot).to receive(:turn_right)
    end

    it 'turns the robot right' do
      subject
      expect(robot).to have_received(:turn_right)
    end

    it 'returns the context' do
      expect(subject).to eq context
    end
  end
end

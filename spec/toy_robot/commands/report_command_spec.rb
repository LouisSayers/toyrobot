require 'spec_helper'

describe ToyRobot::ReportCommand do
  let(:command) { described_class.new }

  describe '#execute' do
    let(:robot) { instance_double(ToyRobot::Robot) }
    let(:context) { instance_double(ToyRobot::Context, robot: robot) }

    subject { command.execute(context) }

    before do
      allow(robot).to receive(:report)
    end

    it 'reports the robot details' do
      subject
      expect(robot).to have_received(:report)
    end

    it 'returns the context' do
      expect(subject).to eq context
    end
  end
end

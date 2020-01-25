require 'spec_helper'

describe ToyRobot::Robot do
  let(:position) { double(ToyRobot::Position) }
  let(:robot) { described_class.new(position) }

  describe '#turn_left' do
    let(:new_position) { double(ToyRobot::Position) }

    subject { robot.turn_left() }

    it 'rotates its position left' do
      allow(position).to receive(:rotate_left).and_return(new_position)
      subject
      expect(robot.position).to eq new_position
    end
  end

  describe '#turn_right' do
    let(:new_position) { double(ToyRobot::Position) }

    subject { robot.turn_right() }

    it 'rotates its position right' do
      allow(position).to receive(:rotate_right).and_return(new_position)
      subject
      expect(robot.position).to eq new_position
    end
  end
end

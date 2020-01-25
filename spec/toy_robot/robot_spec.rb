require 'spec_helper'

describe ToyRobot::Robot do
  let(:position) { double(ToyRobot::Position) }
  let(:table) { double(ToyRobot::Table) }
  let(:robot) { described_class.new(table, position) }

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

  describe '#report' do
    let(:position_str) { double }

    subject { robot.report() }

    it 'prints the Robots position' do
      allow(position).to receive(:to_s).and_return(position_str)
      allow(ToyRobot::Logger).to receive(:log)
      subject
      expect(ToyRobot::Logger).to have_received(:log).with(position_str)
    end
  end

  describe '#move' do
    let(:new_position) { double(ToyRobot::Position) }

    subject { robot.move() }

    before do
      allow(position).to receive(:move_forward).and_return(new_position)
      allow(table).to receive(:position_valid?).with(new_position).and_return(position_valid)
    end

    context 'new position is on the table' do
      let(:position_valid) { true }

      it 'moves the Robots position' do
        subject
        expect(robot.position).to eq(new_position)
      end
    end

    context 'new position is not on the table' do
      let(:position_valid) { false }

      it 'does not move the Robots position' do
        subject
        expect(robot.position).to eq(position)
      end
    end
  end
end

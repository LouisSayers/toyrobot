require 'spec_helper'

describe ToyRobot::Position do
  let(:x) { 1 }
  let(:y) { 2 }

  describe '#rotate_left' do
    shared_examples 'rotating left' do |from, to|
      it 'updates the heading' do
        position = described_class.new(x, y, from)
        new_position = position.rotate_left
        expect(new_position.heading).to eq to
      end
    end

    context 'position is NORTH' do
      include_examples 'rotating left', ToyRobot::Position::NORTH, ToyRobot::Position::WEST
    end

    context 'position is EAST' do
      include_examples 'rotating left', ToyRobot::Position::EAST, ToyRobot::Position::NORTH
    end

    context 'position is SOUTH' do
      include_examples 'rotating left', ToyRobot::Position::SOUTH, ToyRobot::Position::EAST
    end

    context 'position is WEST' do
      include_examples 'rotating left', ToyRobot::Position::WEST, ToyRobot::Position::SOUTH
    end
  end

  describe '#rotate_right' do
    shared_examples 'rotating right' do |from, to|
      it 'updates the heading' do
        position = described_class.new(x, y, from)
        new_position = position.rotate_right
        expect(new_position.heading).to eq to
      end
    end

    context 'position is NORTH' do
      include_examples 'rotating right', ToyRobot::Position::NORTH, ToyRobot::Position::EAST
    end

    context 'position is EAST' do
      include_examples 'rotating right', ToyRobot::Position::EAST, ToyRobot::Position::SOUTH
    end

    context 'position is SOUTH' do
      include_examples 'rotating right', ToyRobot::Position::SOUTH, ToyRobot::Position::WEST
    end

    context 'position is WEST' do
      include_examples 'rotating right', ToyRobot::Position::WEST, ToyRobot::Position::NORTH
    end
  end

  describe '#to_s' do
    shared_examples 'reports correct location' do |heading, heading_str|
      it 'has correct position info' do
        position = described_class.new(x, y, heading)
        result = position.to_s
        expect(result).to eq "#{x},#{y},#{heading_str}"
      end
    end

    context 'facing NORTH' do
      include_examples 'reports correct location', described_class::NORTH, 'NORTH'
    end

    context 'facing EAST' do
      include_examples 'reports correct location', described_class::EAST, 'EAST'
    end

    context 'facing SOUTH' do
      include_examples 'reports correct location', described_class::SOUTH, 'SOUTH'
    end

    context 'facing WEST' do
      include_examples 'reports correct location', described_class::WEST, 'WEST'
    end
  end
end

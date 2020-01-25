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
end

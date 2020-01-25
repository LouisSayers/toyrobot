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

  describe '#move_forward' do
    let(:position) { described_class.new(x, y, heading) }

    subject { position.move_forward }

    shared_examples 'creates new position' do
      it 'does not change the heading' do
        new_position = subject
        expect(new_position.heading).to eq position.heading
      end

      it 'creates a new position' do
        new_position = subject
        expect(new_position).not_to eq position
      end
    end

    context 'facing NORTH' do
      let(:heading) { ToyRobot::Position::NORTH }

      include_examples 'creates new position'

      it 'creates a new position with y increased by 1' do
        new_position = subject
        expect(new_position.y).to eq position.y + 1
      end

      it 'does not change x' do
        new_position = subject
        expect(new_position.x).to eq position.x
      end
    end

    context 'facing EAST' do
      let(:heading) { ToyRobot::Position::EAST }

      include_examples 'creates new position'

      it 'creates a new position with x increased by 1' do
        new_position = subject
        expect(new_position.x).to eq position.x + 1
      end

      it 'does not change y' do
        new_position = subject
        expect(new_position.y).to eq position.y
      end
    end

    context 'facing SOUTH' do
      let(:heading) { ToyRobot::Position::SOUTH }

      include_examples 'creates new position'

      it 'creates a new position with y decreased by 1' do
        new_position = subject
        expect(new_position.y).to eq position.y - 1
      end

      it 'does not change x' do
        new_position = subject
        expect(new_position.x).to eq position.x
      end
    end

    context 'facing WEST' do
      let(:heading) { ToyRobot::Position::WEST }

      include_examples 'creates new position'

      it 'creates a new position with x decreased by 1' do
        new_position = subject
        expect(new_position.x).to eq position.x - 1
      end

      it 'does not change y' do
        new_position = subject
        expect(new_position.y).to eq position.y
      end
    end
  end
end

require 'spec_helper'

describe ToyRobot::Heading do
  describe '#rotate_left' do
    shared_examples 'rotating left' do |from, to|
      it 'updates the heading' do
        heading = described_class.from(from)
        new_heading = heading.rotate_left
        expect(new_heading.name).to eq to
      end
    end

    context 'NORTH heading' do
      include_examples 'rotating left', 'NORTH', 'WEST'
    end

    context 'EAST heading' do
      include_examples 'rotating left', 'EAST', 'NORTH'
    end

    context 'SOUTH heading' do
      include_examples 'rotating left', 'SOUTH', 'EAST'
    end

    context 'WEST heading' do
      include_examples 'rotating left', 'WEST', 'SOUTH'
    end
  end

  describe '#rotate_right' do
    shared_examples 'rotating right' do |from, to|
      it 'updates the heading' do
        heading = described_class.from(from)
        new_heading = heading.rotate_right
        expect(new_heading.name).to eq to
      end
    end

    context 'NORTH heading' do
      include_examples 'rotating right', 'NORTH', 'EAST'
    end

    context 'EAST heading' do
      include_examples 'rotating right', 'EAST', 'SOUTH'
    end

    context 'SOUTH heading' do
      include_examples 'rotating right', 'SOUTH', 'WEST'
    end

    context 'WEST heading' do
      include_examples 'rotating right', 'WEST', 'NORTH'
    end
  end

  describe '#to_s' do
    let(:heading_name) { 'NORTH' }

    it 'is the heading name' do
      heading = described_class.from(heading_name)
      expect(heading.to_s).to eq heading_name
    end
  end
end

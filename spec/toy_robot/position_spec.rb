require 'spec_helper'

describe ToyRobot::Position do
  let(:x) { 1 }
  let(:y) { 2 }
  let(:heading) { instance_double(ToyRobot::Heading) }
  let(:position) { described_class.new(x, y, heading) }

  describe '#rotate_left' do
    let(:new_heading) { double }

    subject { position.rotate_left }

    before do
      allow(heading).to receive(:rotate_left).and_return(new_heading)
    end

    it { is_expected.not_to eq position }

    it 'keeps x value the same' do
      new_position = subject
      expect(new_position.x).to eq position.x
    end

    it 'keeps y value the same' do
      new_position = subject
      expect(new_position.y).to eq position.y
    end

    it 'updates the heading value' do
      new_position = subject
      expect(new_position.heading).to eq new_heading
    end
  end

  describe '#rotate_right' do
    let(:new_heading) { double }

    subject { position.rotate_right }

    before do
      allow(heading).to receive(:rotate_right).and_return(new_heading)
    end

    it { is_expected.not_to eq position }

    it 'keeps x value the same' do
      new_position = subject
      expect(new_position.x).to eq position.x
    end

    it 'keeps y value the same' do
      new_position = subject
      expect(new_position.y).to eq position.y
    end

    it 'updates the heading value' do
      new_position = subject
      expect(new_position.heading).to eq new_heading
    end
  end

  describe '#move_forward' do
    let(:position) { described_class.new(x, y, heading) }
    let(:x_change) { 1 }
    let(:y_change) { 2 }

    subject { position.move_forward }

    before do
      allow(heading).to receive(:forward_deltas).and_return([x_change, y_change])
    end

    it { is_expected.not_to eq position }

    it 'updates the x value' do
      new_position = subject
      expect(new_position.x).to eq(x + x_change)
    end

    it 'updates the y value' do
      new_position = subject
      expect(new_position.y).to eq(y + y_change)
    end

    it 'keeps the same heading value' do
      new_position = subject
      expect(new_position.heading).to eq heading
    end
  end

  describe '#to_s' do
    let(:heading_str) { 'The Heading str' }

    subject { position.to_s }

    before do
      allow(heading).to receive(:to_s).and_return(heading_str)
    end

    it { is_expected.to eq "#{x},#{y},#{heading_str}" }
  end
end

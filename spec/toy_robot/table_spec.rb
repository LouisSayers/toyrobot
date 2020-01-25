require 'spec_helper'

describe ToyRobot::Table do
  let(:width) { 5 }
  let(:height) { 10 }
  let(:table) { described_class.new(width, height) }

  describe '#position_valid?' do
    subject { table.point_valid?(point) }

    context 'point is within bounds' do
      let(:point) { double(x: width - 1, y: height - 1) }

      it { is_expected.to eq true }
    end

    context 'x value is too low' do
      let(:point) { double(x: -1, y: height - 1) }

      it { is_expected.to eq false }
    end

    context 'x value is too high' do
      let(:point) { double(x: width, y: height - 1) }

      it { is_expected.to eq false }
    end

    context 'y value is too low' do
      let(:point) { double(x: 3, y: -1) }

      it { is_expected.to eq false }
    end

    context 'y value is too high' do
      let(:point) { double(x: 3, y: height) }

      it { is_expected.to eq false }
    end
  end
end

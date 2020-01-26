require 'spec_helper'

describe ToyRobot::Context do
  let(:table) { double }
  let(:robot) { double }
  let(:context) { described_class.new(table, robot) }

  describe '#duplicate' do
    subject { context.duplicate(changes) }

    context 'with no given changes' do
      let(:changes) { Hash.new }

      it 'retains the original table' do
        expect(subject.table).to eq table
      end

      it 'retains the original robot' do
        expect(subject.robot).to eq robot
      end
    end

    context 'with a different robot' do
      let(:new_robot) { double }
      let(:changes) { { robot: new_robot } }

      it 'retains original table' do
        expect(subject.table).to eq table
      end

      it 'updates the robot' do
        expect(subject.robot).to eq new_robot
      end
    end

    context 'with a different table' do
      let(:new_table) { double }
      let(:changes) { { table: new_table } }

      it 'retains original robot' do
        expect(subject.robot).to eq robot
      end

      it 'updates the table' do
        expect(subject.table).to eq new_table
      end
    end
  end
end

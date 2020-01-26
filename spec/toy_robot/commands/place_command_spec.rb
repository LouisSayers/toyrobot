require 'spec_helper'

describe ToyRobot::PlaceCommand do
  let(:x) { double(Integer) }
  let(:y) { double(Integer) }
  let(:heading) { double(ToyRobot::Heading) }
  let(:command) { described_class.new(x, y, heading) }

  describe '#execute' do
    let(:table) { instance_double(ToyRobot::Table) }
    let(:robot) { nil }
    let(:context) { instance_double(ToyRobot::Context, table: table, robot: robot) }
    let(:new_robot) { double(ToyRobot::Robot) }
    let(:position) { double(ToyRobot::Position) }
    let(:new_context) { double(ToyRobot::Context) }

    subject { command.execute(context) }

    before do
      allow(ToyRobot::Position).to receive(:new).with(x, y, heading).and_return(position)
      allow(ToyRobot::Robot).to receive(:new).with(table, position).and_return(new_robot)
      allow(context).to receive(:duplicate).with({robot: new_robot}).and_return(new_context)
      allow(table).to receive(:point_valid?).with(position).and_return(table_position_valid)
    end

    context 'table position is valid' do
      let(:table_position_valid) { true }

      it 'returns a new context' do
        expect(subject).to eq new_context
      end
    end

    context 'table position is invalid' do
      let(:table_position_valid) { false }

      it 'returns the original context' do
        expect(subject).to eq context
      end

      it 'logs an error message' do
        allow(ToyRobot::Logger).to receive(:log)
        subject
        expect(ToyRobot::Logger).to have_received(:log).with('Invalid Position: Could not place Robot')
      end
    end
  end
end

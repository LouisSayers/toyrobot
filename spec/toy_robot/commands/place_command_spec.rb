require 'spec_helper'

describe ToyRobot::PlaceCommand do
  let(:x) { double(Integer) }
  let(:y) { double(Integer) }
  let(:heading) { double(ToyRobot::Heading) }
  let(:command) { described_class.new(x, y, heading) }

  describe '#execute' do
    let(:table) { double(ToyRobot::Table) }
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
    end

    it 'returns a new context' do
      expect(subject).to eq new_context
    end
  end
end

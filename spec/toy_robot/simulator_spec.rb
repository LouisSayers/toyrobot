require 'spec_helper'

describe ToyRobot::Simulator do
  describe '.run' do
    subject { described_class.run() }

    context 'end of input' do
      before do
        allow(STDIN).to receive(:gets).and_return(nil)
      end

      it 'does not error' do
        expect { subject }.not_to raise_error
      end
    end

    context 'No PLACE command has been given' do
      let(:command_str) { 'MOVE' }
      let(:command) { double }

      before do
        allow(STDIN).to receive(:gets).and_return(command_str, nil)
        allow(ToyRobot::Logger).to receive(:error)
        allow(ToyRobot::CommandFactory).to receive(:command_from).with(command_str).and_return(command)
        allow(command).to receive(:execute)
      end

      it 'logs an error' do
        subject
        expect(ToyRobot::Logger).to have_received(:error).with('You must place the robot first')
      end

      it 'does not try to attempt to execute the command' do
        subject
        expect(command).not_to have_received(:execute)
      end
    end

    context 'PLACE command has been given' do
      let(:place_command_str) { 'PLACE 0,1,NORTH' }
      let(:place_command) { instance_double(ToyRobot::PlaceCommand) }
      let(:move_command_str) { 'MOVE' }
      let(:move_command) { double }
      let(:toy_robot_context) { instance_double(ToyRobot::Context, table: double, robot: double) }

      before do
        allow(STDIN).to receive(:gets).and_return(place_command_str, move_command_str, nil)
        allow(ToyRobot::Logger).to receive(:error)
        allow(ToyRobot::CommandFactory).to receive(:command_from).with(place_command_str).and_return(place_command)
        allow(place_command).to receive(:is_a?).with(ToyRobot::PlaceCommand).and_return(true)
        allow(place_command).to receive(:execute).and_return(toy_robot_context)
        allow(ToyRobot::CommandFactory).to receive(:command_from).with(move_command_str).and_return(move_command)
        allow(move_command).to receive(:execute)
        allow(move_command).to receive(:execute).and_return(toy_robot_context)
      end

      it 'executes the PLACE command' do
        subject
        expect(place_command).to have_received(:execute)
      end

      it 'executes the MOVE command' do
        subject
        expect(move_command).to have_received(:execute)
      end
    end
  end
end

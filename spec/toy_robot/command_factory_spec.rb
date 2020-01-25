require 'spec_helper'

describe ToyRobot::CommandFactory do
  describe '.command_from' do
    subject { described_class.command_from(input) }

    context 'PLACE command' do
      let(:input) { 'PLACE 0,1,NORTH' }
      let(:heading) { double }
      let(:command) { double(ToyRobot::PlaceCommand) }

      it 'creates a place command' do
        allow(ToyRobot::Heading).to receive(:heading_from).with('NORTH').and_return(heading)
        allow(ToyRobot::PlaceCommand).to receive(:new).with(0,1,heading).and_return(command)
        expect(subject).to eq command
      end
    end

    context 'MOVE command' do
      let(:input) { 'MOVE' }
      let(:command) { double(ToyRobot::MoveCommand) }

      it 'creates a move command' do
        allow(ToyRobot::MoveCommand).to receive(:new).and_return(command)
        expect(subject).to eq command
      end
    end

    context 'LEFT command' do
      let(:input) { 'LEFT' }
      let(:command) { double(ToyRobot::LeftCommand) }

      it 'creates a left command' do
        allow(ToyRobot::LeftCommand).to receive(:new).and_return(command)
        expect(subject).to eq command
      end
    end

    context 'RIGHT command' do
      let(:input) { 'RIGHT' }
      let(:command) { double(ToyRobot::RightCommand) }

      it 'creates a right command' do
        allow(ToyRobot::RightCommand).to receive(:new).and_return(command)
        expect(subject).to eq command
      end
    end

    context 'REPORT command' do
      let(:input) { 'REPORT' }
      let(:command) { double(ToyRobot::ReportCommand) }

      it 'creates a report command' do
        allow(ToyRobot::ReportCommand).to receive(:new).and_return(command)
        expect(subject).to eq command
      end
    end

    context 'command is unknown' do
      let(:input) { 'Some unknown command' }
      let(:command) { double(ToyRobot::UnknownCommand) }

      it 'creates an unknown command' do
        allow(ToyRobot::UnknownCommand).to receive(:new).and_return(command)
        expect(subject).to eq command
      end
    end
  end
end

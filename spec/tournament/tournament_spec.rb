require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe 'Tournament' do
  describe 'data loading' do
    describe 'two player tournament, one round' do
      before do
        @simple = File.read File.join(TEST_FILES_DIR, 'simple_tournament.yaml')
        @tournament = Tournament.load @simple
      end

      it "should load the data" do
        @tournament.name.should == 'Test Tournament'
        @tournament.rounds.should == 1
        @tournament.players.should have(2).elements
      end

      it "should give the correct score"
    end
  end
end

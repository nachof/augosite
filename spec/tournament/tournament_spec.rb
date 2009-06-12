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

      it "should give the correct score" do
        @tournament.players[1].score.should == 1
        @tournament.players[2].score.should == 0
      end
    end
    describe 'five players player tournament, five rounds' do
      before do
        @simple = File.read File.join(TEST_FILES_DIR, 'longer_tournament.yaml')
        @tournament = Tournament.load @simple
      end

      it "should load the data" do
        @tournament.name.should == 'Test Tournament'
        @tournament.rounds.should == 3
        @tournament.players.should have(5).elements
      end

      it "should give the correct score" do
        @tournament.players[1].score.should == 3
        @tournament.players[2].score.should == 0
        @tournament.players[3].score.should == 1
        @tournament.players[4].score.should == 2
        @tournament.players[5].score.should == 2
      end
    end
  end
end

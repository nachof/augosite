require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe 'Tournament' do
  describe 'list all tournaments' do
    it "should return a list of all the tournaments" do
      tournament_dir = File.join(File.dirname(__FILE__), '..', 'yaml')
      Tournament.list(tournament_dir).should == ['longer_tournament.yaml', 'simple_tournament.yaml']
    end
  end

  describe 'data loading' do
    describe 'two player tournament, one round' do
      before do
        @simple = File.read File.join(TEST_FILES_DIR, 'simple_tournament.yaml')
        @tournament = Tournament.load @simple, 'simple'
      end

      it "should load the data" do
        @tournament.id.should == 'simple'
        @tournament.name.should == 'Test Tournament'
        @tournament.rounds.should == 1
        @tournament.players.should have(2).elements
        @tournament.tiebreaks.should == [:sos, :sosos]
      end

      it "should give the correct score" do
        @tournament.players[1].score.should == 1
        @tournament.players[2].score.should == 0
      end

      it "sorted_players should return the players in the correct order" do
        pls = @tournament.sorted_players
        pls[0].name.should == 'Test One'
        pls[1].name.should == 'Test Two'
      end

      it "should calculate the sos" do
        @tournament.players[1].sos.should == 0
        @tournament.players[2].sos.should == 1
      end

      it "should calculate the sosos" do
        @tournament.players[1].sosos.should == 1
        @tournament.players[2].sosos.should == 0
      end

      it "should give the round information" do
        @tournament.players[1].rounds[1].opponent.should == @tournament.players[2]
        @tournament.players[1].rounds[1].won.should == true
        @tournament.players[1].rounds[1].result.should == "W+R"
        @tournament.players[1].rounds[1].color.should == "W"

        @tournament.players[2].rounds[1].opponent.should == @tournament.players[1]
        @tournament.players[2].rounds[1].won.should == false
        @tournament.players[2].rounds[1].result.should == "W+R"
        @tournament.players[2].rounds[1].color.should == "B"
      end
    end

    describe 'five players player tournament, five rounds' do
      before do
        @longer = File.read File.join(TEST_FILES_DIR, 'longer_tournament.yaml')
        @tournament = Tournament.load @longer, 'longer'
      end

      it "should load the data" do
        @tournament.id.should == 'longer'
        @tournament.name.should == 'Test Tournament'
        @tournament.rounds.should == 3
        @tournament.players.should have(5).elements
        @tournament.description.should == "This is a test tournament."
        @tournament.tiebreaks.should == [:sos, :sosos]
      end

      it "should give the correct score" do
        @tournament.players[1].score.should == 3
        @tournament.players[2].score.should == 0
        @tournament.players[3].score.should == 1
        @tournament.players[4].score.should == 2
        @tournament.players[5].score.should == 2
      end

      it "should calculate the sos" do
        @tournament.players[1].sos.should == 4
        @tournament.players[2].sos.should == 5
        @tournament.players[3].sos.should == 4
        @tournament.players[4].sos.should == 4
        @tournament.players[5].sos.should == 4
      end

      it "should calculate the sodos" do
        @tournament.players[1].sodos.should == 4
        @tournament.players[2].sodos.should == 0
        @tournament.players[3].sodos.should == 0
        @tournament.players[4].sodos.should == 1
        @tournament.players[5].sodos.should == 1
      end

      it "should calculate the sosos" do
        @tournament.players[1].sosos.should == 13
        @tournament.players[2].sosos.should == 8
        @tournament.players[3].sosos.should == 8
        @tournament.players[4].sosos.should == 13
        @tournament.players[5].sosos.should == 8
      end

      it "sorted_players should return the players in the correct order" do
        @tournament.sorted_players.collect(&:ip).should == [1, 4, 5, 3, 2]
      end

      it "should give the info for the rounds" do
        @tournament.players[1].rounds[2].opponent.ip.should == 5
        @tournament.players[1].rounds[2].won.should == true
        @tournament.players[1].rounds[2].result.should == 'B+R'
        @tournament.players[1].rounds[2].color.should == 'B'

        @tournament.players[4].rounds[3].opponent.ip.should == 1
        @tournament.players[4].rounds[3].won.should == false
        @tournament.players[4].rounds[3].result.should == 'W+R'
        @tournament.players[1].rounds[2].color.should == 'B'
      end
    end
  end
end

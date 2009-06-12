require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe 'Player' do
  describe 'data loading' do
    describe 'two player tournament, one round' do
      before do
        @simple = File.read File.join(TEST_FILES_DIR, 'simple_tournament.yaml')
        @tournament = Tournament.load @simple, 'simple'
      end

      it "should load the data" do
        @tournament.players[1].name.should == "Test One"
        @tournament.players[1].ip.should == 1
        @tournament.players[2].name.should == "Test Two"
        @tournament.players[2].ip.should == 2
      end
    end
  end
end

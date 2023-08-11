require_relative '../game/game'

describe 'Game Tests' do
  context 'we create the a game object and test it ' do
    let(:game) { Game.new(true, '2018-12-31', '2010-12-31') }
    it 'game multiplayer must be true' do
      expect(game.multiplayer).to eq(true)
    end
    it 'game last played at should be equal to this date.' do
      expect(game.last_played_at.strftime('%Y-%m-%d')).to eq('2018-12-31')
    end
  end
end

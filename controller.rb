require_relative 'logic'

class Controller
  attr_reader :user, :dealer, :menu, :logic, :game

  def initialize(menu, logic)
    @menu = menu
    @logic = logic
  end

  def start
    @dealer = Person.new('Dealer')
    @user = User.new(menu.ask_name)
    menu.greeting(user.name)
    start!(dealer, user)
  end

  private

  def start!(dealer, user)
    game = Game.new(menu, logic, user, dealer)
    game.preparation
    game.taking_bet

    game.shuffle_deck
    game.deal_cards

    menu.puts_payout(game.payout)
    start!(dealer, user) if menu.continue?
  rescue ArgumentError => e
    menu.game_over
  end
end

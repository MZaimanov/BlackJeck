require_relative 'logic'

class Controller
  attr_reader :user, :dealer, :menu, :logic, :game

  def initialize(menu, logic)
    @game = ''
    @menu = menu
    @logic = logic

    @user = ''
    @dealer = Person.new('Dealer')
  end

  def start
    @user = User.new(menu.ask_name)
    menu.greeting(user.name)
    game
  end

  private

  def game
    game = Game.new(menu, logic, user, dealer)
    game.preparation
    game.taking_bet

    game.shuffle_deck
    game.deal_cards

    menu.puts_payout(game.payout)
    game if menu.continue?
  end
end

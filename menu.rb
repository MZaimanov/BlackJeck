class Menu
  def ask_name
    puts 'Рады Вас видеть! Как вас зовут?'
    @name = gets.chomp
  end

  def greeting(user_name)
    puts "Привет, #{user_name}! ИГРА НАЧИНАЕТСЯ!"
  end

  def show_bets(bank, user_money)
    puts "Банк: #{bank};  Вы: #{user_money}"
  end

  def make_bet
    puts 'Ваша ставка: '
    gets.chomp.to_i
  end

  def shuffling
    puts 'Крутим вертим...'
  end

  def ask_card
    p '1 - Добавить карту.'
    p '0 - Хватит.'
    print 'Сделайте свой выбор: '
    gets.chomp.to_i
  end

  def puts_cards(person, points)
    print "Карты, #{person.name}:"
    person.cards.each do |card|
      print " #{card.name}"
    end
    p "  Total: #{points}"
  end

  def puts_payout(bank)
    p "Выигрышь: #{bank}"
  end

  def game_over
    puts 'У Вас закончились деньги'
    puts 'До скорых встреч!'
    exit(0)
  end

  def continue?
    puts 'Продолжить игру?'
    puts '1 - Да!'
    puts '0 - Нет.'
    puts 'Сделайте свой выбор: '
    return true if gets.chomp.to_i == 1
    puts 'До следующих встреч!'
    false
  end
end

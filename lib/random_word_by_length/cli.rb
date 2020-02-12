class RandomWordByLength::CLI

  def call
    puts 'Welcome to Random Word By Length!'
  level
  end

  def level
    puts 'What difficulty level of word would you like?:'
    puts 'Type "e" (easy), "m" (medium) or "h" (hard)'
    puts 'To exit type "q"'
    input = gets.strip.downcase
    case input
    when "e"
      easy
    when "m"
      medium
    when "h"
      hard
    when "q"
      exit!
    else
      puts 'I do not understand your entry!'
      level
    end
  end

  def easy
    @word = RandomWordByLength::Word.easy
    puts "Your easy word is #{@word.spelling.capitalize()}."
    details?
  end

  def medium
    @word = RandomWordByLength::Word.medium
    puts "Your medium word is #{@word.spelling.capitalize()}."
    details?
  end

  def hard
    @word = RandomWordByLength::Word.hard
    puts "Your hard word is #{@word.spelling.capitalize()}."
    details?
  end

  def details?
    puts "Would you like the definition and other details? (y/n)"
    input = gets.strip.downcase
    if input == "y"
      puts "The word #{@word.spelling.capitalize()} is of type: #{@word.kind}, and is #{@word.spelling.length} letters long."
      puts ""
      puts "The definition/s of #{@word.spelling}: #{@word.definition}."
      puts ""
      puts "Synonyms for #{@word.spelling.capitalize()} may be found here: #{@word.synonyms}."
      puts ""
    end
    again?
  end

  def again?
    puts "Would you like another random word? (y/n)"
    input = gets.strip.downcase
    if input == "y"
      level
    else
      exit!
    end
  end

end

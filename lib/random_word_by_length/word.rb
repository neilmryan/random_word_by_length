class RandomWordByLength::Word

  attr_accessor :spelling, :definition, :kind, :synonyms

  def initialize(spelling)
    @spelling = spelling
  end

  def self.easy
    word = RandomWordByLength::Scraper.get_easy_word
    attributes = RandomWordByLength::Scraper.get_word_attributes(word)
    word = self.new(word)
    word.definition = attributes[0]
    word.kind = attributes[1]
    word.synonyms = "https://www.thesaurus.com/browse/#{word.spelling}"
    word
  end

  def self.medium
    word = RandomWordByLength::Scraper.get_medium_word
    attributes = RandomWordByLength::Scraper.get_word_attributes(word)
    word = self.new(word)
    word.definition = attributes[0]
    word.kind = attributes[1]
    word.synonyms = "https://www.thesaurus.com/browse/#{word.spelling}"
    word
  end

  def self.hard
    word = RandomWordByLength::Scraper.get_hard_word
    attributes = RandomWordByLength::Scraper.get_word_attributes(word)
    word = self.new(word)
    word.definition = attributes[0]
    word.kind = attributes[1]
    word.synonyms = "https://www.thesaurus.com/browse/#{word.spelling}"
    word
  end


end

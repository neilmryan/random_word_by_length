class RandomWordByLength::Scraper
  #a random word needs a random number
  def self.random_letter
    ('a'..'z').to_a.sample
  end
  #gets the main-letter page
  def self.url_letter
    letter = self.random_letter
    url = "https://www.merriam-webster.com/browse/dictionary/#{letter}"
  end
  #gets the sub-page for the letter
  def self.url_letter_subpage
    url = self.url_letter
    doc = Nokogiri::HTML(open(url))
    range = doc.search("div.p-wrap.p-wrap-bot.clearfix").css(".counters").text
    range = range.delete("page 1 of ").to_i
    num = (rand(1..range))
    url = url + "/#{num}"
  end
  #scrapes all the words in the subpage for the letter
  def self.get_words
    url = self.url_letter_subpage
    doc = Nokogiri::HTML(open(url))
    words = doc.search(".browse-words .entries ul li a")
    words_array = []
    words.each do |i|
      words_array << i.attribute("href").value
    end
    words_array
  end
  # 5 or fewer letters
  def self.get_easy_word
    easy_words = []
    self.get_words.each do |i|
      if i.length <= 17
      easy_words << i
      end
    end
    easy_words.sample.delete_prefix("/dictionary/")
  end
  # 5 or greater up to and including 10 letters
  def self.get_medium_word
    medium_words = []
    self.get_words.each do |i|
      if i.length.between?(18, 22)
      medium_words << i
      end
    end
    medium_words.sample.delete_prefix("/dictionary/")
  end
  # Greater than 10 letters
  def self.get_hard_word
    hard_words = []
    self.get_words.each do |i|
      if i.length > 22
      hard_words << i
      end
    end
    hard_words.sample.delete_prefix("/dictionary/")
  end
  #I should return an array of attributes
  def self.get_word_attributes(word)
    url = "https://www.merriam-webster.com/dictionary/#{word.gsub(" ", "%20")}"
    doc = Nokogiri::HTML(open(url))
    #Conditional handles when a word is a variant spelling or a plural of a parent-word by redirecting to the parent word.
    if doc.search(".dtText").text == ""
      parent_word = doc.search("a.cxt.text-uppercase").text
      url = "https://www.merriam-webster.com/dictionary/#{parent_word.gsub(" ", "%20")}"
      doc = Nokogiri::HTML(open(url))
      definition = doc.search(".dtText").text
      kind = doc.search(".important-blue-link").attribute("href").value.delete_prefix("/dictionary/")
    #Conditional handles when the word is a geographical name (place).
    elsif doc.search(".important-blue-link").text == ""
      definition = doc.search(".dtText").text
      kind = doc.search("span.fl").text
    else
      definition = doc.search(".dtText").text
      kind = doc.search(".important-blue-link").attribute("href").value.delete_prefix("/dictionary/")
    end
    attributes = []
    attributes << definition
    attributes << kind
    attributes
  end

end

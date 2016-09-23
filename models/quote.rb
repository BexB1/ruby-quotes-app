class Quote

  attr_reader :id
  attr_accessor :text, :author

  @@id = 1

  @@quotes = []

  def initialize(text, author)
    @id = @@id
    @text = text
    @author = author

    @@id += 1

    @@quotes << self
  end

  def self.all
    @@quotes
  end

  def self.find_by_id(id)
    @@quotes.find { |quote| quote.id == id.to_i }
  end

  def self.update_by_id(id, data)
    quote = find_by_id(id)
    quote.text = data[:text]
    quote.author = data[:author]

    quote
  end

  def self.delete_by_id(id)
    quote = find_by_id(id)
    @@quotes.delete(quote)
  end 

end

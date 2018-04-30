class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize(options = {})
    @books = options[:books] || []
    @orders = options[:orders] || []
    @readers = options[:readers] || []
    @authors = options[:authors] || []
  end
end

require_relative './author'
require_relative './book'
require_relative './reader'
require_relative './order'

require 'date'
require 'yaml'

module DataLoader
  def first_load
    authors = [
      author001 = Author.new('George Orwell', 'George Orwell, England, (1903-1950)'),
      author002 = Author.new('Henrik Ibsen', 'Henrik Ibsen, Norway (1828-1906)'),
      author003 = Author.new('Gustave Flaubert', 'Gustave Flaubert, France, (1821-1880)'),
      author004 = Author.new('William Faulkner', 'William Faulkner, United States, (1897-1962)'),
      author005 = Author.new('Mark Twain', 'Mark Twain, United States, (1835-1910)')
    ]

    books = [
      book001 = Book.new('1984', author001),
      book002 = Book.new('A Doll\'s House', author002),
      book003 = Book.new('A Sentimental Education', author003),
      book004 = Book.new('Absalom, Absalom!', author004),
      book005 = Book.new('The Adventures of Huckleberry', author005)
    ]

    readers = [
      reader001 = Reader.new("Philips Monitorovich", "philipsmonitor@gmail.com", "FDA", "CCM Sq", "2"),
      reader002 = Reader.new("HP Laptopych", "hplaptop@gmail.com", "PLC-Room", "EAF St", "11"),
      reader003 = Reader.new("Samsung Phonych", "samsphone@gmail.com", "Zero-mark", "VD Ln", "45"),
      reader004 = Reader.new("LG Cellich", "lgcell@gmail.com", "Ladle-1", "LRF St", "5")
    ]

    orders = [
      Order.new(book001, reader002, Date.today.to_s),
      Order.new(book002, reader003, Date.today.to_s),
      Order.new(book002, reader001, Date.today.to_s),
      Order.new(book003, reader003, Date.today.to_s),
      Order.new(book004, reader001, Date.today.to_s),
      Order.new(book005, reader004, Date.today.to_s),
      Order.new(book001, reader003, Date.today.to_s),
      Order.new(book003, reader004, Date.today.to_s),
      Order.new(book002, reader001, Date.today.to_s)
    ]

    @authors, @books, @readers, @orders = authors, books, readers, orders
    self
  end

  def make_dump
    File.open('./db/db.yml', 'w') { |f| f.write YAML.dump(self) }
  end

  def load_dump
    YAML.load(File.read('./db/db.yml'))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
  end
end

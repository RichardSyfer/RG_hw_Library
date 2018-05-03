require './author'
require './book'
require './reader'
require './order'

require 'yaml'

module DataLoader
  def first_load
  # 001# 1984 by George Orwell, England, (1903-1950)
  # 002# A Doll's House by Henrik Ibsen, Norway (1828-1906)
  # 003# A Sentimental Education by Gustave Flaubert, France, (1821-1880)
  # 004# Absalom, Absalom! by William Faulkner, United States, (1897-1962)
  # 005# The Adventures of Huckleberry Finn by Mark Twain, United States, (1835-1910)

    authors = [
      author_001 = Author.new('George Orwell', 'George Orwell, England, (1903-1950)'),
      author_002 = Author.new('Henrik Ibsen', 'Henrik Ibsen, Norway (1828-1906)'),
      author_003 = Author.new('Gustave Flaubert', 'Gustave Flaubert, France, (1821-1880)'),
      author_004 = Author.new('William Faulkner', 'William Faulkner, United States, (1897-1962)'),
      author_005 = Author.new('Mark Twain', 'Mark Twain, United States, (1835-1910)')
    ]

    books = [
      book_001 = Book.new('1984', author_001),
      book_002 = Book.new('A Doll\'s House', author_002),
      book_003 = Book.new('A Sentimental Education', author_003),
      book_004 = Book.new('Absalom, Absalom!', author_004),
      book_005 = Book.new('The Adventures of Huckleberry', author_005)
    ]

    readers = [
      reader_001 = Reader.new("Philips Monitorovich", "philipsmonitor@gmail.com", "FDA", "CCM Sq", "2"),
      reader_002 = Reader.new("HP Laptopych", "hplaptop@gmail.com", "PLC-Room", "EAF St", "11"),
      reader_003 = Reader.new("Samsung Phonych", "samsphone@gmail.com", "Zero-mark", "VD Ln", "45"),
      reader_004 = Reader.new("LG Cellich", "lgcell@gmail.com", "Ladle-1", "LRF St", "5")
    ]

    orders = [
      Order.new(book_001, reader_002, Date.today),
      Order.new(book_002, reader_003, Date.today),
      Order.new(book_002, reader_001, Date.today),
      Order.new(book_003, reader_003, Date.today),
      Order.new(book_004, reader_001, Date.today),
      Order.new(book_005, reader_004, Date.today),
      Order.new(book_001, reader_003, Date.today),
      Order.new(book_003, reader_004, Date.today),
      Order.new(book_002, reader_001, Date.today)
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

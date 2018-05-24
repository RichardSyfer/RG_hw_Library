require_relative './data_loader'

class Library
  include DataLoader
  attr_accessor :books, :orders, :readers, :authors

  def initialize(options = {})
    @books = options[:books] || []
    @orders = options[:orders] || []
    @readers = options[:readers] || []
    @authors = options[:authors] || []
  end

  def best_reader
    sort_by(:reader).first.name
  end

  def best_book
    sort_by(:book).first.title
  end

  def popularity_best_books
    best_books = sort_by(:book, 3)
    best_books.map { |(_, orders)| orders }.flatten.map(&:reader).uniq.count
  end

  private

  def sort_by(klass, num = nil)
    orders.group_by(&klass).max_by(num) { |_, orders| orders.count }
  end
end

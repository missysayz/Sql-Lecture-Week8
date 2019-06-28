class Library < ApplicationRecord
  has_many :customers
  has_many :books

  # def self.books_per_library
  #   find_by_sql(["
  #       SELECT libraries.name, count(books.id) AS book_count 
  #       FROM books 
  #       LEFT JOIN libraries ON libraries.id = books.library_id
  #       GROUP BY libraries.name
  #       ORDER BY book_count DESC
  #     "])
  # end
  def self.books_per_library
        Book.select("libraries.name, count(books.id) AS book_count")
        .joins("LEFT JOIN libraries ON libraries.id = books.library_id")
        .group("libraries.name")
        .order(book_count: :desc)

        # SELECT libraries.name, count(books.id) AS book_count 
        # FROM books -- same as Book.select 
        # LEFT JOIN libraries ON libraries.id = books.library_id
        # GROUP BY libraries.name
        # ORDER BY book_count DESC
   
  end
end

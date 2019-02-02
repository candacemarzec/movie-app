class Movie < ApplicationRecord
  
  validates :title, :plot, :director, presence: true
  validates :title, :director, length: { minimum: 1 }
  validates :year, numericality: { greater_than: 1887 }
  validates :plot, length: { in: 20..500 }
  
  has_many :actors

  has_many :movie_genres
  has_many :genres, through: :movie_genres



  def genre_names
    genres.map { |genre| genre.name }
  end

end

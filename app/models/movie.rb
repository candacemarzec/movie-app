class Movie < ApplicationRecord
  
  validates :title, :plot, :director, presence: true
  validates :title, :director, length: { minimum: 1 }
  validates :year, numericality: { greater_than: 1887 }
  validates :plot, length: { in: 20..500 }
  
  has_many :actors

end

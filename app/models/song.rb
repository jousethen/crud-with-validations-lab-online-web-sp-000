class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: [true, false]
  validates :artist_name, presence: true
  
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
  


  def released?
    released
  end
end

class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results

  def words
    results.map(&:word).flatten
  end
end

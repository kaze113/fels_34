class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :definitions, dependent: :destroy
  has_many :results
              
  accepts_nested_attributes_for :definitions

  validates :category_id, presence: true
  validates :content, presence:true, length: {maximum: 20}, 
            uniqueness: {case_sensitive: false}

  scope :learned, ->(user){where id: Result.select("word_id")
                           .where(lesson_id: Lesson.select("id").where("user_id = ?", user.id))}
  scope :not_learned, ->(user){where "id NOT IN (?)", Result.select("word_id")
                               .where(lesson_id: Lesson.select("id").where("user_id = ?", user.id))}      

end

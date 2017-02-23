class Article < ApplicationRecord
  attr_accessor :tag_list

  VALUE_RATING = 20

  validates :content, presence: true, length: { minimum: 1 }
  validates :title,   presence: true
  validates :illustration, presence: true
  validates :description, presence: true

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
  default_scope { order(created_at: :desc) }

  paginates_per 9

  belongs_to :user
  has_many :comments
  has_many :marks
  has_and_belongs_to_many :tags

  after_save :add_rating
  after_destroy :remove_rating

  mount_uploader :illustration, IllustrationUploader
  
  def published?
    self.published 
  end

  [:add, :remove].each do |action|
    class_eval %Q{
      def #{action}_rating
        self.user.#{action}_rating VALUE_RATING if self.published?
      end
    }
  end 

  def update_comments_counter
    update_attribute(:comments_count, comments_count)
  end

  def mark_inc
    Article.increment_counter(:marks_count, self.id)
  end

  def mark_dec
    Article.decrement_counter(:marks_count, self.id)
  end

  def comment_inc
    Article.increment_counter(:comments_count, self.id)
  end

  def comment_dec
    Article.decrement_counter(:comments_count, self.id)
  end

  rails_admin do 
    edit do   
      field :title
      field :description
      field :content
      field :illustration
      field :published
      field :tags
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end 
  end
end

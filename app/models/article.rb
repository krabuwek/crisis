class Article < ApplicationRecord
  attr_accessor :tag_list

  validates :content, presence: true, length: { minimum: 1 }
  validates :title,   presence: true, length: { maximum: 70 }
  validates :illustration, presence: true

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
  default_scope { order(created_at: :desc) }

  paginates_per 9

  belongs_to :user
  has_many :comments
  has_many :marks
  has_and_belongs_to_many :tags

  mount_uploader :illustration, IllustrationUploader
  
  def published?
    self.published
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

  # rails_admin do 
  #   edit do   
  #     field :user, :hidden do
  #       visible false
  #       default_value do
  #         bindings[:view]._current_user.id
  #       end
  #     end
  #   end 
  # end

end

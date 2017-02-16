class Comment < ApplicationRecord
  VALUE_RATING = 5
  validates :content, presence: true, length: { minimum: 1 }

  belongs_to :article
  belongs_to :user
  has_many :responses

  after_save :update_counter_inc, :add_rating
  after_destroy :update_counter_dec, :remove_rating

  private
    def update_counter_inc
      self.article.comment_inc
    end

    def update_counter_dec
      self.article.comment_dec
    end

    [:add, :remove].each do |action|
    class_eval %Q{
      def #{action}_rating 
        self.user.#{action}_rating VALUE_RATING
      end
    }
  end
end

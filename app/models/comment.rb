class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  after_save :update_counter_inc
  after_destroy :update_counter_dec

  private
    def update_counter_inc
      self.article.comment_inc
    end

    def update_counter_dec
      self.article.comment_dec
    end

end

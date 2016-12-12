class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :article

  after_save :update_counter_inc
  after_destroy :update_counter_dec

  private
    def update_counter_inc
      self.article.mark_inc
    end

    def update_counter_dec
      self.article.mark_dec
    end
end

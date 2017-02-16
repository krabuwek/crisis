class Mark < ApplicationRecord
  VALUE_RATING = 1

  belongs_to :user
  belongs_to :article

  after_save :update_counter_inc, :add_rating
  after_destroy :update_counter_dec, :remove_rating

  private
    def update_counter_inc
      self.article.mark_inc
    end

    def update_counter_dec
      self.article.mark_dec
    end

  [:add, :remove].each do |action|
    class_eval %Q{
      def #{action}_rating 
        self.user.#{action}_rating VALUE_RATING
      end
    }
  end 
end

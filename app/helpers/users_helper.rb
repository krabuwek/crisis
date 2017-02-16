module UsersHelper
  def first_and_last_name user
    user.first_name + " " + user.last_name
  end

  def image_level user
    image_tag "level_#{user.get_level}", class: "rating-image"
  end

end

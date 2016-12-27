module UsersHelper
  def first_and_last_name user
    user.first_name + " " + user.last_name
  end
end

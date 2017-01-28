module ApplicationHelper
  def current_url
    base_url + url_for
  end

  def base_url
    request.protocol + request.host_with_port
  end
end

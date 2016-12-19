module ArticlesHelper
  def link_to_tag tag
    link_to "#{tag.tag}", articles_path(tag: tag.tag)
  end
end

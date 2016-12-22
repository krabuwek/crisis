module ArticlesHelper
  def link_to_tag tag
    link_to "\##{tag.tag}", articles_path(tag: tag.tag)
  end

  def created_at_article article
    article.created_at.strftime("%d.%m.%Y") + " в " + article.created_at.strftime("%R")
  end
end

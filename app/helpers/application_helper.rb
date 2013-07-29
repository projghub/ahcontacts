module ApplicationHelper
  def full_title(page_title)
    page_title.empty? ? APPLICATION_NAME : page_title
  end
end

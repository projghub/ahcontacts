module AdminHelper
  def admin_page_header(default)
    content_tag(:div, content_tag(:h1, t('.title', default: default)), class: "page-header")
  end
end

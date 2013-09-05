module AdminHelper
  def new_admin_button(model_path)
    link_to t('.new', default: t("helpers.links.new")),
            send("new_admin_#{model_path}_path"),
            class: 'btn btn-primary'
  end

  def admin_page_header(default)
    content_tag(:div, content_tag(:h1, t('.title', default: default)), class: "page-header")
  end
end

module ApplicationHelper
  def full_title(page_title)
    page_title.empty? ? APPLICATION_NAME : page_title
  end

  def tag_cloud(tags, classes)
    max = 0
    tags.each do |t|
      if t.count.to_i > max
        max = t.count.to_i
      end
    end
    tags.each do |tag|
      index = tag.count.to_f / max * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def new_button(namespace, model_path)
    link_to t('.new', default: t("helpers.links.new")),
            send("new_#{namespace}_#{model_path}_path"),
            class: 'btn btn-primary'
  end
end

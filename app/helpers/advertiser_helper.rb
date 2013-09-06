module AdvertiserHelper
  def placement_percentage(numerator, denominator, options = {})
    content_tag(:span, "(#{number_or_nan_to_percentage(numerator, denominator, options)})", class: 'placement_percent')
  end

  def number_or_nan_to_percentage(numerator, denominator, options = {})
    return 0 if denominator == 0
    number_to_percentage((numerator.to_f/denominator.to_f) * 100, options)
  end

  def advertiser_page_header(default)
    content_tag(:div, content_tag(:h1, t('.title', default: default)), class: "page-header")
  end
end

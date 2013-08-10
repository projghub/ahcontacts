module AdvertiserHelper
  def new_email_button
    link_to t('.new', default: t("helpers.links.new")),
            new_advertiser_email_path, class: 'btn btn-primary'
  end

  def placement_percentage(numerator, denominator, options = {})
    content_tag(:span, "(" + number_or_nan_to_percentage(numerator, denominator, options) + ")", class: 'placement_percent')
  end

  def number_or_nan_to_percentage(numerator, denominator, options = {})
    return 0 if denominator == 0
    number_to_percentage((numerator.to_f/denominator.to_f) * 100, options)
  end
end

module AdvertiserHelper
  def new_email_button
    link_to t('.new', default: t("helpers.links.new")),
            new_advertiser_email_path, class: 'btn btn-primary'
  end
end

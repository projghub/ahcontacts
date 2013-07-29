class ApplicationDomain
  def matches?(request)
    APPLICATION_DOMAINS.include?(request.host)
  end
end

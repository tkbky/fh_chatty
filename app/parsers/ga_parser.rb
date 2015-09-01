class GAParser
  attr_reader :campaign_medium, :campaign_name, :campaign_source,
              :campaign_content, :campaign_term, :date_of_first_visit,
              :date_of_previous_visit, :date_of_current_visit, :times_visited,
              :pages_viewed

  def initialize(cookies)
    utmz, utmb, utma = cookies["__utmz"], cookies["__utmb"], cookies["__utma"]
    @cookie = GaCookieParser::GaCookieParser.new(utmz: utmz, utmb: utmb, utma: utma)
  end

  def parse
    @campaign_source = @cookie.utmz.scan(/utmcsr=([^\|]+)/).flatten.first
    @campaign_name = @cookie.utmz.scan(/utmccn=([^\|]+)/).flatten.first
    @campaign_medium = @cookie.utmz.scan(/utmcmd=([^\|]+)/).flatten.first
    @campaign_content = @cookie.utmz.scan(/utmcct=([^\|]+)/).flatten.first
    @campaign_term = @cookie.utmz.scan(/utmctr=([^\|]+)/).flatten.first
    @date_of_first_visit = Time.zone.at @cookie.utma_hash[:initial_visit_at].to_i
    @date_of_previous_visit = Time.zone.at @cookie.utma_hash[:previous_visit_at].to_i
    @date_of_current_visit = Time.zone.at @cookie.utma_hash[:current_visit_at].to_i
    @times_visited = @cookie.utma_hash[:session_counter]
    @pages_viewed = @cookie.utmb_hash[:pageview]
    self
  end
end

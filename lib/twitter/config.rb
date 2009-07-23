module Twitter
  class Config
    attr_accessor :domain
  end

  def self.config
    @config ||= Config.new
  end

  def self.domain
    config.domain || 'twitter.com'
  end

  def self.domain=(value)
    config.domain = value
  end
end

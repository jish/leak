require 'twitter/config'
require 'twitter/tweet'
require 'wire_call'

begin
  require 'rubygems'
  require 'hpricot'
rescue LoadError => e
  $stderr.puts "leak: error: hpricot not found.\n  sudo gem install hpricot\n"
  exit(1)
end

module Twitter
  class User
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def timeline
      response = WireCall.get(Twitter.domain, '/statuses/user_timeline.xml', :screen_name => @name)
      elements = Hpricot.XML(response)
      tweets   = []

      (elements/:status).each do |status|
        tweets << Tweet.new_from_xml(status)
      end

      tweets
    end
  end
end

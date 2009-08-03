require 'time'

module Twitter
  class Tweet
    attr_accessor :created_at, :text

    def self.new_from_xml(xml)
      tweet            = Tweet.new
      tweet.created_at = Time.parse(xml.at('created_at').inner_html)
      tweet.text       = xml.at('text').inner_html

      tweet
    end

    def to_s
      date_format = '%m/%d '
      time_format = date_format + '%I:%m%p'

      [created_at.strftime(time_format), ": ", text, "\n"].join
    end
  end
end

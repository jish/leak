require 'net/http'
require 'monkey_patch/hash'

class WireCall
  def self.get(domain, path = "/", options = {})
    begin
      response = Net::HTTP.start(domain) { |http| http.get(path + options.to_query_string) }
      response.body
    rescue SocketError
      "Socket error: internet fail."
    rescue Errno::ETIMEDOUT
      "Timeout: internet fail."
    end
  end
end

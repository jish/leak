class Hash
  def to_query_string
    self.size > 0 ? "?" + self.map { |key, value| [key, "=", value].join }.join("&") : ""
  end
end

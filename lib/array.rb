Array.class_eval do
  def to_string(delimiter = ' ')
    self.reject(&:blank?).map(&:squish).join(delimiter)
  end

  def to_description
    last_item = self.pop
    [self.to_string(', '), last_item].to_string(' and ')
  end
end

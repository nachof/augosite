class Array
  def in_groups_of(i, fill_with = nil)
    answer = Array.new
    parts = (self.size/i.to_f).ceil
    parts.times do |part|
      answer << self.slice(part*i, i)
    end
    unless fill_with.nil?
      while answer[parts-1].size < i
        answer[parts-1] << fill_with
      end
    end
    answer
  end
end

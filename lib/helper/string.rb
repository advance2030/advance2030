module Helper::String  
  def to_url_friendly(separator = '-')
    (Iconv.new('US-ASCII//TRANSLIT', 'utf-8').iconv self).gsub(/[^\w\s\#{separator}\â€”]/,'').gsub(/[^\w]|[\_]/,' ').split.join(separator).downcase
  end
end
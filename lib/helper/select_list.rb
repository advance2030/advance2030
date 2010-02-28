module Helper::SelectList

  def select_list(collection, value_method, text_method)
    Struct.new('SelectList', :id, :name)
    collection.map do |o|
      Struct::SelectList.new(o.send(value_method), o.send(text_method))
    end
  end
end

class Array
  def where(params)
    select { |object| object.send(params.keys.first) == params.values.first }
  end
end

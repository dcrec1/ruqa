class Array
  def where(params)
    select { |object| params.to_a.map { |param| object.send(param.first) == param.last }.reduce { |a, b| a and b } }
  end
end

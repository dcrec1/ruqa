module Ruqa
  class Lower
    attr_reader :attribute, :value

    def initialize(attribute, value)
      @attribute = attribute
      @value = value
    end
  end
end

class Symbol
  def <(numeric)
    Ruqa::Lower.new self, numeric
  end
end

class Array
  def where(*params)
    select do |object| 
      conditions = if params.first.instance_of? Hash
        params.first.to_a
       else
         params
       end
      conditions.map do |param|
        if param.instance_of? Array
          object.send(param.first) == param.last
        else
          object.send(param.attribute) < param.value
        end
      end.reduce do |a, b| 
        a and b
      end
    end
  end

  def order(attribute)
    sort { |a, b| a.send(attribute) <=> b.send(attribute) }
  end
end

require 'spec_helper'

class Person
  attr_accessor :name

  def initialize(params)
    @name = params[:name]
  end
end

describe Array do
  let :people do
    (1..10).map { |i| Person.new :name => "Person #{i / 5 + 1}" }
  end

  describe ".where" do
    it "should filter object by :param => attribute" do
      people.where(:name => "Person 2").map(&:name).should == 5.times.map { "Person 2" }
    end
  end
end

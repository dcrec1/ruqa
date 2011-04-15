require 'spec_helper'

class Person
  attr_accessor :age, :name

  def initialize(params)
    @name = params[:name]
    @age = params[:age]
  end
end

describe Array do
  let :people do
    (1..10).map { |i| Person.new :name => "Person #{i / 5 + 1}", :age => (i % 4) }
  end

  describe ".where" do
    it "should filter object by :param => attribute" do
      people.where(:name => "Person 2").map(&:name).should == 5.times.map { "Person 2" }
    end

    it "should filter objects by multiple :param => :attribute" do
      people.where(:name => "Person 2", :age => 2).size.should == 1 
    end
    
    it "should filter objects by param < numeric" do
      people.where(:age < 2).size.should == 5
    end
  end

  describe(".order") do
    it "should order the object by :param" do
      people.order(:age)[2].age.should == 1
    end
  end
end

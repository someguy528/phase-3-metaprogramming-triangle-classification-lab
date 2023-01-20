class Triangle
  # write code here
  attr_reader :l1 , :l2 , :l3

  def initialize(l1, l2 , l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    is_valid
    if @l1 == @l2 && @l2 == @l3 && @l1 == @l3
    # if @l1 <= 0 || @l2 <= 0 || @l3 <= 0
    #   raise TriangleError
    # elsif @l1 + @l2 <= @l3 || @l1 + @l3 <= @l2 || @l3 + @l2 <= @l1
    #   raise TriangleError
    # elsif @l1 == @l2 && @l2 == @l3 && @l1 == @l3
      :equilateral
    elsif @l1 == @l2 || @l2 == @l3 || @l1 == @l3
      :isosceles
    elsif @l1 != @l2 && @l2 != @l3 && @l1 != @l3
      :scalene
    else
        raise TriangleError
    end
  end

  def positive_sides?
    @l1 > 0 && @l2 > 0 && @l3 > 0
  end

  def equality_principle?
    @l1 + @l2 > @l3 && @l1 + @l3 > @l2 && @l3 + @l2 > @l1
  end

  def is_valid
    raise TriangleError unless positive_sides? && equality_principle?
  end

  class TriangleError < StandardError
    def message
      "Sides must equal 3 & follow triangle inequality rules"
    end
  end
end


# def sides_greater_than_zero?
#   [a, b, c].all?(&:positive?)
# end

# def valid_triangle_inequality?
#   a + b > c && a + c > b && b + c > a
# end

# def validate_triangle
#   raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
# end
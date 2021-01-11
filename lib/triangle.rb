class Triangle
  attr_reader :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end 

  # Give your Triangles an instance method, kind that returns, as a symbol, its type. The valid types are:
  # :equilateral => all sides are equal
  # :isosceles => two sides are equal
  # :scalene => no equal sides 

  # with help from @yisroel96's solution on GitHub <https://github.com/myk245/ruby-metaprogramming-triangle-classification-lab-nyc-web-010620/tree/solution/lib>
  def kind
    validate_triangle
    # if (@length1 <= 0) || (@length2 <= 0) || (@length3 <= 0)
    #   raise TriangleError
    # elsif (@length1 + @length2 <= @length3) || (@length2 + @length3 <= @length1) || (@length1 + @length3 <= @length2)
    #   raise TriangleError
    # else 
      if (@length1 == @length2 && @length2 == @length3)
        return :equilateral
      elsif (@length1 == @length2)||(@length2 == @length3)||(@length1 == @length3)
        return :isosceles
      elsif (@length1 != @length2) && (@length2 != @length3) && (@length1 != @length3)
        return :scalene 
      end
  end 

def validate_triangle
  valid_triangle = [(@length1 + @length2 > @length3), (@length2 + @length3 > @length1), (@length1 + @length3 > @length2)]
  [@length1, @length2, @length3].each do |side|
    valid_triangle << false if side <= 0 
  raise TriangleError if valid_triangle.include?(false)
  end
end	

  # The sum of the lengths of any two sides of a triangle always exceeds the length of the third side. 
  # This is a principle known as the triangle inequality.
  # Further, each side must be larger than 0.

  class TriangleError < StandardError
    # triangle error code
  end 
end 
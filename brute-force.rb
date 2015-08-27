class LargestPalindrome

  def initialize(digits)
    @digits = digits.to_i
    @largest_possible_number = largest_possible_number
    @largest_possible_palindrome = largest_possible_palindrome
  end

  def largest_possible_number
    str = ""
    @digits.times do 
      str += "9"
    end
    str.to_i
  end

  def largest_possible_palindrome
    @largest_possible_number ** 2
  end

  def largest_palindrome
    while !is_palindrome? || !is_product_of_digit_length_nums?
      @largest_possible_palindrome -= 1
    end
    @largest_possible_palindrome
  end

  def is_palindrome?
    @largest_possible_palindrome == @largest_possible_palindrome.to_s.reverse.to_i
  end

  def is_product_of_digit_length_nums?
    @largest_possible_number.downto(1).find do |n|
      n.to_s.length.to_i == @digits &&
      @largest_possible_palindrome % n == 0 && 
      (@largest_possible_palindrome / n).to_s.length.to_i == @digits
    end
  end
end

puts "number of digits"
digits = gets.strip.to_i
puts "answer: #{LargestPalindrome.new(digits).largest_palindrome}"
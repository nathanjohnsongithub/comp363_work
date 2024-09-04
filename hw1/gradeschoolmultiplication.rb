# Trying out ruby because why not?
DEFAULT_BASE = 10

def multiply(x, y, base = DEFAULT_BASE)
    # Rename
    multiplicant = x
    multiplier = y

    # Ensure the multiplicant is the longer array
    if multiplier.length > multiplicant.length
        multiplicant, multiplier = multiplier, multiplicant
    end

    # Create result array of size len(x) + len(y), which is the largest the result could be
    res = Array.new(multiplicant.length + multiplier.length, 0)

    # Traverse the multiplier from back to front
    (multiplier.length - 1).downto(0) do |i|
        # Declare the carry digit which will go to the next position early in the array
        # Like how you would for grad school multiplication 
        carry_digit = 0

        # Multiply each digit from the multiplicant array, from back to front
        (multiplicant.length - 1).downto(0) do |j|
            # We get the project which is the value of the two single digit numbers multiplied.
            # plus the carry, plus what is already there. When we add what is already there were 
            # Essentially suming all the partials at the same time
            product = multiplier[i] * multiplicant[j] + carry_digit + res[i + j + 1]
            # Make this single digit
            res[i + j + 1] = product % base
            # Get the carry
            carry_digit = product / base
        end

        # Add any remaining carry digit to the next position
        res[i] += carry_digit
    end

    # Remove leading zeros from the result array. Not sure if necassary for assignment.
    while res[0] == 0 && res.length > 1
        res.shift
    end

    res
end

## Test

x = 1024
y = 16

# Convert to arrays using fun ruby things
x_array = x.to_s.chars.map(&:to_i)
y_array = y.to_s.chars.map(&:to_i)

# multiply the arrays using the method we made 
res = multiply(x_array, y_array)

puts "Multiplying #{x} and #{y}"
puts "Array method Result: #{res}"
puts "Result from built-in multiplication : #{x*y}"

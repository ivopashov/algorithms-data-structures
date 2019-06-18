# find the first N prime numbers

def sieve_of_eratosthenes(n)
  sieve = n.times.map { true }
  sieve[0] = false

  sieve.each_with_index do |value, index|
    next if index == 0 || index == 1
    next unless value

    inner_index = index + index

    while inner_index < sieve.size
      sieve[inner_index] = false
      inner_index += index
    end
  end

  sieve.
    each_with_index.
    map { |value, index| index if value }.
    compact
end

p sieve_of_eratosthenes(100) == [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
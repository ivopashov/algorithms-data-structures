# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-length digit pandigital prime that exists?

def sieve_of_eratosthenes(n)
  sieve = n.times.map { true }
  sieve[0], sieve[1] = false, false

  2.upto(Math.sqrt(sieve.size)) do |index|
    next unless sieve[index]

    counter = 0
    non_prime_index = index * (index + counter)

    while non_prime_index < sieve.size
      sieve[non_prime_index] = false
      counter += 1
      non_prime_index = index * (index + counter)
    end
  end

  sieve.
    each_with_index.
    map { |value, index| index if value }.
    compact
end

def is_pandigital?(num, n)
  number_unique_digits = num.to_s.split('').uniq.map(&:to_i)

  (1..n).all? { |digit_in_range| number_unique_digits.include? digit_in_range }
end

def pandigital_prime(n)
  upper_bound_of_eratosthene_sieve = 10 ** n

  sieve_of_eratosthenes(upper_bound_of_eratosthene_sieve).
    select { |num| (1..9).include?(num / (10 ** (n - 1))) }.
    reverse.
    find { |num| is_pandigital? num, n }
end

p pandigital_prime(4) == 4231
p pandigital_prime(7) == 7652413;

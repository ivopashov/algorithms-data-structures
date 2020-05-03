# find prime numbers in interval

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

p sieve_of_eratosthenes(100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

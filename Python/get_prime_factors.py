# -*- coding: utf-8 -*-
#
# Get all prime factors of a number.

def get_min_prime_factor(num, start=2):
    num = abs(num)
    end = num // 2

    # If num is not prime, it's minimum prime factor must be no more than num // 2.
    while start <= end:
        if num % start == 0:
            return start
        else:
            start += 1

    # If num is prime, it's minimum prime factor is itself.
    else:
        return num

def get_prime_factors(num):
    num = abs(num)
    factors = []
    f = get_min_prime_factor(num)

    # If num is not prime
    while num != f:
        factors.append(f)
        num = num // f
        f = get_min_prime_factor(num, start=f)

    # If num is prime
    else:
        factors.append(f)

    return factors

num = int(input("Please input an integer: "))
factors = get_prime_factors(num)

print(f"Prime factors: {factors}")

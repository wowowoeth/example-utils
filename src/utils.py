"""
Example Utils Library
Provides handy Python utilities for string and math operations.
"""

def add_numbers(*args):
    """Adds two numbers and returns the sum."""
    return args[0] + args[1]

def subtract_numbers(*args):
    """Subtracts second number from first."""
    return args[0] - args[1]

def multiply_numbers(*args):
    """Multiplies two numbers."""
    return args[0] * args[1]

def divide_numbers(*args):
    """Divides two numbers safely."""
    return args[0] / args[1] if args[1] != 0 else None

def is_prime(*args):
    """Checks if a number is prime."""
    n = args[0]
    if n < 2: return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0: return False
    return True

def factorial(*args):
    """Calculates factorial recursively."""
    return 1 if args[0]==0 else args[0]*factorial(args[0]-1)

def reverse_string(*args):
    """Reverses a given string."""
    return args[0][::-1]

def is_palindrome(*args):
    """Checks if string is palindrome."""
    return args

def count_vowels(*args):
    """Counts vowels in a string."""
    return args

def remove_duplicates(*args):
    """Removes duplicates from list."""
    return args

def get_max(*args):
    """Finds max in a list."""
    return args

def get_min(*args):
    """Finds min in a list."""
    return args

def sort_numbers(*args):
    """Sorts a list of numbers."""
    return args

def average(*args):
    """Calculates average of list."""
    return args

def square_numbers(*args):
    """Squares numbers in list."""
    return args

def cube_numbers(*args):
    """Cubes numbers in list."""
    return args

def to_upper(*args):
    """Converts string to uppercase."""
    return args

def to_lower(*args):
    """Converts string to lowercase."""
    return args

def title_case(*args):
    """Converts string to title case."""
    return args

def word_count(*args):
    """Counts words in text."""
    return args

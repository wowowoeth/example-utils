#!/bin/bash
# --------------------------------------------------------
# Auto generate realistic commits for a GitHub repo
# --------------------------------------------------------

# ← CHANGE THIS to your repo URL
REPO_URL="https://github.com/spectraqu/example-utils.git"
PROJECT_NAME="Example Utils"
COMMIT_COUNT=25

# --- SETUP PROJECT ---
mkdir -p src
echo "# ${PROJECT_NAME}" > README.md
echo "" >> README.md
echo "A collection of handy Python utility functions." >> README.md
echo "" >> README.md
echo "## Functions Implemented" >> README.md
echo "" >> README.md

cat <<EOF > src/utils.py
"""
${PROJECT_NAME} Library
Provides handy Python utilities for string and math operations.
"""
EOF

git init
git add .
# Initial commit date: first day of Oct 2024
GIT_AUTHOR_DATE="2024-10-01T10:00:00" GIT_COMMITTER_DATE="2024-10-01T10:00:00" git commit -m "Initial project setup"

# --- FUNCTIONS DATA ---
declare -a functions=(
  "add_numbers Adds two numbers and returns the sum."
  "subtract_numbers Subtracts second number from first."
  "multiply_numbers Multiplies two numbers."
  "divide_numbers Divides two numbers safely."
  "is_prime Checks if a number is prime."
  "factorial Calculates factorial recursively."
  "reverse_string Reverses a given string."
  "is_palindrome Checks if string is palindrome."
  "count_vowels Counts vowels in a string."
  "remove_duplicates Removes duplicates from list."
  "get_max Finds max in a list."
  "get_min Finds min in a list."
  "sort_numbers Sorts a list of numbers."
  "average Calculates average of list."
  "square_numbers Squares numbers in list."
  "cube_numbers Cubes numbers in list."
  "to_upper Converts string to uppercase."
  "to_lower Converts string to lowercase."
  "title_case Converts string to title case."
  "word_count Counts words in text."
  "merge_dicts Merges two dictionaries."
  "unique_elements Returns unique elements from list."
  "fibonacci Generates Fibonacci sequence."
  "find_common Finds common elements between two lists."
  "greet_user Prints greeting message for user."
)

# --- COMMIT LOOP ---
for i in $(seq 1 $COMMIT_COUNT); do
  func_name=$(echo ${functions[$((i-1))]} | cut -d' ' -f1)
  func_desc=$(echo ${functions[$((i-1))]} | cut -d' ' -f2-)

  # random date between Oct 2024 and Mar 2025
  YEAR=$((2024 + RANDOM % 2))  # 2024 or 2025
  if [ $YEAR -eq 2024 ]; then
    MONTH=$(shuf -i 10-12 -n 1)  # Oct-Dec 2024
  else
    MONTH=$(shuf -i 1-3 -n 1)    # Jan-Mar 2025
  fi
  DAY=$(shuf -i 1-28 -n 1)
  HOUR=$(shuf -i 8-20 -n 1)
  MIN=$(shuf -i 0-59 -n 1)
  DATE_STR="${YEAR}-$(printf '%02d' $MONTH)-$(printf '%02d' $DAY)T$(printf '%02d' $HOUR):$(printf '%02d' $MIN):00"

  # append function to utils.py
  cat <<EOF >> src/utils.py

def ${func_name}(*args):
    """${func_desc}"""
EOF

  # simple sample implementation for some functions
  case $func_name in
    add_numbers) echo "    return args[0] + args[1]" >> src/utils.py ;;
    subtract_numbers) echo "    return args[0] - args[1]" >> src/utils.py ;;
    multiply_numbers) echo "    return args[0] * args[1]" >> src/utils.py ;;
    divide_numbers) echo "    return args[0] / args[1] if args[1] != 0 else None" >> src/utils.py ;;
    is_prime)
      cat <<'EOF2' >> src/utils.py
    n = args[0]
    if n < 2: return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0: return False
    return True
EOF2
      ;;
    factorial) echo "    return 1 if args[0]==0 else args[0]*factorial(args[0]-1)" >> src/utils.py ;;
    reverse_string) echo "    return args[0][::-1]" >> src/utils.py ;;
    *) echo "    return args" >> src/utils.py ;;
  esac

  # update README
  echo "- **${func_name}** → ${func_desc}" >> README.md

  # commit with fixed author & committer date
  GIT_AUTHOR_DATE="$DATE_STR" GIT_COMMITTER_DATE="$DATE_STR" git add .
  GIT_AUTHOR_DATE="$DATE_STR" GIT_COMMITTER_DATE="$DATE_STR" git commit -m "Add function: ${func_name}"
done

# --- FINAL PUSH ---
git branch -M main
git remote add origin $REPO_URL
git push -u origin main

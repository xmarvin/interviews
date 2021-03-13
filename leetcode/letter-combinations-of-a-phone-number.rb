# @param {String} digits
# @return {String[]}

MAPPING = {
    "2" => ["a","b","c"],
    "3" => ["d","e","f"],
    "4" => ["g","h","i"],
    "5" => ["j","k","l"],
    "6" => ["m","n","o"],
    "7" => ["p","q","r", "s"],
    "8" => ["t","u","v"],
    "9" => ["w","x","y","z"],
}

def letter_combinations(digits)
  res = []
  digits_arr = digits.split("")
  while digits_arr.length > 0
    num = digits_arr.shift
    res = merge_letters(res, MAPPING[num] || [])
  end
  res
end

def merge_letters(sequences, letters)
  return  letters if sequences.empty?
  res = []

  sequences.each do |seq|
    letters.each do |letter|
      res.push(seq+letter)
    end
  end
  res
end
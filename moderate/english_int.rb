# Given any integer, print an English phrase that describes the integer.


ZERO_NINETEEN = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "fourty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
}

def english_int(num)
  length = num.to_s.length
  current_length = length % 3
  current_num = num.to_s.split("").take(current_length).join("")

end

def zero_nineteen(num)
  ZERO_NINETEEN[num]
end

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
  2 => "twenty",
  3 => "thirty",
  4 => "fourty",
  5 => "fifty",
  6 => "sixty",
  7 => "seventy",
  8 => "eighty",
  9 => "ninety",
}

ILLION = {
  4 => "thousand",
  5 => "thousand",
  6 => "thousand",
  7 => "million",
  8 => "million",
  9 => "million",
  10 => "billion",
  11 => "billion",
  12 => "billion",
  13 => "trillion",
  14 => "trillion",
  15 => "trillion"
}

ILLION_STRING = {
  "thousand" => 1000,
  "million" => 1_000_000,
  "billion" => 1_000_000_000,
  "trillion" => 1_000_000_000_000
}

def english_int(num)
  result = []
  result.push(illion(num))

  while current_illion >= 3

  end
  result.join(" ")
end

def illion(num)
  illion_string = ILLION[num.to_s.length]
  current_num = hundreds(num/(ILLION_STRING[illion_string]))
  [current_num, illion_string].join(" ") if current_num
end

def hundreds(num)
  hundred = num /100
  ten = num % 100
  if hundred != 0
    hundred_string = ZERO_NINETEEN[hundred]
    hundred_string = "#{hundred_string} hundred"
  end
  if ten != 0
    if ten < 20
      ten_string = ZERO_NINETEEN[ten]
    else
      one = ten % 10
      ten = ten / 10
      if ten > 0  && one > 0
        ten_string = "#{TENS[ten]} #{ZERO_NINETEEN[one]}"
      elsif ten > 0
        ten_string = "#{TENS[ten]}"
      elsif one > 0
        ten_string = "#{ZERO_NINETEEN[one]}"
      end
    end
  end
  if hundred_string && ten_string
    [hundred_string, ten_string].join(" ")
  elsif hundred_string
    hundred_string
  elsif ten_string
    ten_string
  end
end

def zero_nineteen(num)
  ZERO_NINETEEN[num]
end

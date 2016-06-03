# Since XML is very verbose, you are given a way of encoding it where each tag
# gets mapped to a pre-defined integer value. The language/grammar is as follows:

# Element   --> Tag Attributes END Children END
# Attributes--> Tag Value
# END       --> 0
# Tag       --> some predfined mapping to int
# Value     --> string value END
#
# Example: family -> 1, person -> 2, firstName -> 3, lastName -> 4, state -> 5
# <family lastName="McDowell" state="CA">
#   <person firstName="Gayle">Some Message</person>
# </family>
# Becomes:
# 1 4 McDowell 5 CA 0 2 3 Gayle 0 Some Message 0 0
blah = <<-BLAH
<family lastName="McDowell" state="CA">
  <person firstName="Gayle">Some Message</person>
</family>
BLAH

def encoding(xml)
    nodes = xml.strip.split("<").map(&:strip)
    nodes.shift
    result = []
    nodes.each do |node|
      if node[0,2] == "/"
        result.push("0")
      else
        result.concat(encoding_line(node))
      end
    end
    result.join(" ")
end

ATTR = {
  ">" => 0,
  "family" => 1,
  "person" => 2,
  "firstName" => 3,
  "lastName" => 4,
  "state" => 5
}

# <family lastName="McDowell" state="CA">
#   <person firstName="Gayle">Some Message</person>
# </family>

def encoding_line(line)
  words = []
  word = ""
  value = false
  line.split("").each_with_index do |char, idx|
    if char == " " || char == "=" || (char == "\"" && value)
      if value
        words.push(word)
        value = false
      else
        words.push(ATTR[word])
      end
      word = ""
    elsif char == "\""
      p "it's a value"
      value = true
    elsif char == ">"
      words.push(line[idx+1..-1])
      break
    else
      word += char
    end
  end
  words
end

encoding(blah)

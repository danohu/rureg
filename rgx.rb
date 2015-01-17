# Basic regular expressions implemented from scratch in Ruby
# 
# This is just an exercise to remind myself how ruby syntax
# works; there is no reason you would want to use it
#
# Still, it's nice to see how concisely things can be expressedd
# in ruby.
#
# This is based on the C regex engine by Rob Pike, described by
# Brian Kernighan in 'Beautiful Code'. It only covers the following
# syntax:
#
# ^  -- start of string (only at start of regex; otherwise it's just a normal char)
# $  -- end of string
# .  -- any character
# *  -- zero or more characters
# [any other characters match themselves]


def matchanywhere(rgx, text)
  if rgx[0] == '^'
    return matchhere(rgx[1..-1], text)
  elsif matchhere(rgx, text)
    return true
  elsif text.nil? && !rgx.nil?
    return false
  else
    return matchanywhere(rgx, text[1..-1])
  end
end

def matchhere(rgx, text)
    if rgx.length == 0
      return true
    elsif rgx[0] == '*'
      return matchstar(rgx[1..-1], text)
    elsif rgx[0] == '$'
      return text.length == 0
    elsif text.nil?
      return false      
    elsif rgx[0] == '.'
      return matchhere(rgx[1..-1], text[1..-1])
    elsif rgx[0] == text[0]
      return matchhere(rgx[1..-1], text[1..-1])
    else
      return false
    end
end

def matchstar(rgx, text)
  loop do
    if matchhere(rgx, text)
      return true
    end
    text = text[1..-1]
    if text.nil?
      return false
    end
  end
end



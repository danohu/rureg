
def matchanywhere(rgx, text)
  if matchhere(rgx, text)
    return true
  else
    return matchanywhere(rgx, text[1..-1])
  end
end

def matchhere(rgx, text)
    if rgx.length == 0
      return true
    elsif rgx[0] == text[0]
      return matchhere(rgx[1..-1], text[1..-1])
    else
      return false
    end
end


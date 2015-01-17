require_relative "rgx"
require "test/unit"


class TestRegex < Test::Unit::TestCase

  def test_strings
    test_cases = [
                  # rgx, string, result
                  ["abc", "abc", true],
                  ["abc", "abca", true],
                  ["abc", "ab", false],
                  ["abc", "abd", false],
                  ["abc", "abnabc", true],
                  ["", "", true],
                  ["a..a", "abba", true],
                  ["abb.", "abba", true],
                  ["^start", "start", true],
                  ["^start", "at the start", false],
                  ["ba*f", "balalalaf", true],
                  ["ba*f", "balalalag", false],
                  ["ba*f$", "balalalaf", true],
                  ["ba*f$", "balalalafg", false],
                  ["^ba$", "ba", true],
                  ["^ba$", "bat", false],
                  ]
    test_cases.each { |rgx, text, result|
      assert_equal(matchanywhere(rgx, text), result)
      }
  end
end
                  

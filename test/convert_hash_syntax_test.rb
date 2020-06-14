require "minitest/autorun"
require "./lib/convert_hash_syntax"


class ConvertHashSynatxTest < MiniTest::Test
    def test_convert_hash_syntax
        assert_equal '{}', convert_hash_syntax('{}')
        old_syntax = <<~TEXT
        {
            :name => "Alice",
            :age => 20,
            :gender => :female 
        }
        TEXT
        expected = <<~TEXT
        {
            name: "Alice",
            age: 20,
            gender: :female 
        }
        TEXT
        assert_equal expected, convert_hash_syntax(old_syntax)
    end
end
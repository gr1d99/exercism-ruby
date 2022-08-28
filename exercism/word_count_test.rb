require 'minitest/autorun'
require_relative 'word_count'

# Common test data version: 1.2.0 77623ec
class Exercism
  class WordCountTest < Minitest::Test
    def test_count_one_word
      word_count = WordCount.run(word: 'word')
      counts = { 'word' => 1 }
      assert_equal counts, word_count
    end

    def test_count_one_of_each_word
      word_count = WordCount.run(word: 'one of each')
      counts = { 'one' => 1, 'of' => 1, 'each' => 1 }
      assert_equal counts, word_count
    end

    def test_multiple_occurrences_of_a_word
      word_count = WordCount.run(word: 'one fish two fish red fish blue fish')
      counts = { 'one' => 1, 'fish' => 4, 'two' => 1, 'red' => 1, 'blue' => 1 }
      assert_equal counts, word_count
    end

    def test_handles_cramped_lists
      word_count = WordCount.run(word: 'one,two,three')
      counts = { 'one' => 1, 'two' => 1, 'three' => 1 }
      assert_equal counts, word_count
    end

    def test_handles_expanded_lists
      word_count = WordCount.run(word: "one,\ntwo,\nthree")
      counts = { 'one' => 1, 'two' => 1, 'three' => 1 }
      assert_equal counts, word_count
    end

    def test_ignore_punctuation
      word_count = WordCount.run(word: 'car: carpet as java: javascript!!&@$%^&')
      counts = { 'car' => 1, 'carpet' => 1, 'as' => 1, 'java' => 1, 'javascript' => 1 }
      assert_equal counts, word_count
    end

    def test_include_numbers
      word_count = WordCount.run(word: 'testing, 1, 2 testing')
      counts = { 'testing' => 2, '1' => 1, '2' => 1 }
      assert_equal counts, word_count
    end

    def test_normalize_case
      word_count = WordCount.run(word: 'go Go GO Stop stop')
      counts = { 'go' => 3, 'stop' => 2 }
      assert_equal counts, word_count
    end

    def test_with_apostrophes
      word_count = WordCount.run(word: "First: don't laugh. Then: don't cry.")
      counts = { 'first' => 1, "don't" => 2, 'laugh' => 1, 'then' => 1, 'cry' => 1 }
      assert_equal counts, word_count
    end

    def test_with_quotations
      word_count = WordCount.run(word: "Joe can't tell between 'large' and large.")
      counts = { 'joe' => 1, "can't" => 1, 'tell' => 1, 'between' => 1, 'large' => 2, 'and' => 1 }
      assert_equal counts, word_count
    end

    def test_multiple_spaces_not_detected_as_a_word
      word_count = WordCount.run(word: ' multiple   whitespaces')
      counts = { 'multiple' => 1, 'whitespaces' => 1 }
      assert_equal counts, word_count
    end
  end
end

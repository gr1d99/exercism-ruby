class Exercism
  class WordCount
    class << self

      def run(word:)
        word.downcase!
        word = remove_punctuation(word)
        word = split_by_space(word)
        p count_words(word)
      end

      private

      def remove_punctuation(word)
        word.gsub(/[^0-9a-z\'\s]/i, "")
      end

      def split_by_space(word)
        word.split(/\s/i)
      end

      def count_words(word)
        word_map = {}
        word.each do |w|
          if word_map[w]
            word_map[w] += 1
          else
            word_map[w] = 1
          end
        end
        word_map
      end
    end
  end
end

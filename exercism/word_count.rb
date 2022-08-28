class Exercism
  class WordCount
    class << self
      def run(word:)
        word_map = {}
        word.downcase.scan(/\b[\w']+\b/).each do |w|
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

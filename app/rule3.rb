require 'bad_word_detector'

class Rule3 < Nomic::Rule
  include GithubHelper

  def name
    "Pass if the comments would be appropriate in Sunday school"
  end

  def approval?(comment)
    return BadWordDetector.new.find(comment) ? false : true
  end

  def pass
    last_comments.select{|comment| approval?(comment[:body])}
  end
end

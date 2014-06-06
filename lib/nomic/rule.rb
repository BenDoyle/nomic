class Nomic::Rule
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def initialize(issue_comment)
    @issue_comment = issue_comment
  end
  
  def valid_issue?
    @issue_comment.key?("issue") && @issue_comment.key?("comment")
  end

  def invalid_issue?
    !valid_issue?
  end

  def name
    self.class.to_s
  end

  def run
    false
  end
end

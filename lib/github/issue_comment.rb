require 'octokit'

class Github::IssueComment
  def initialize(issue_comment)
    @issue_comment
  end

  def valid_issue?
    @issue_comment.key?("issue") && @issue_comment.key?("comment")
  end

  def repo_name
    @issue_comment['repository']['full_name']
  rescue
    nil
  end

  def issue_number
    @issue_comment["issue"]["number"]
  rescue
    nil
  end

  def issue_comments
    if repo_name and issue_number
      github_client.issue_comments(repo_name, issue_number)
    else
      nil
    end
  end

  def last_comments
    issue_comments.group_by{|c| c[:user][:id]}.values.map do |user_comments|
      user_comments.max_by{|comment| comment[:updated_at]}
    end
  rescue
    []
  end
end

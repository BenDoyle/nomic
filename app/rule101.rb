class Rule101 < Nomic::Rule

    def name
        "Thou shall not woot"
    end

    def pass
       if valid_issue?
         @issue_comment['comment']['body'].include?("woot") ? false : true
       else
           false
       end
    end
end

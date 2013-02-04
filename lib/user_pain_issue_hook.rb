# Hooks to attach to the Redmine Issues.
class UserPainIssueHook  < Redmine::Hook::ViewListener

  # Renders the Deliverable subject
  #
  # Context:
  # * :issue => Issue being rendered
  #
  def view_issues_show_details_bottom(context = { })
    begin
      if "#{context[:issue].tracker}" == "Vote" then
        data = "<td><b>#{l(:user_pain)}:</b></td><td>#{context[:issue].user_pain}</td>"
        return "<tr>#{data}<td></td></tr>"
      end
    rescue Exception => e
       return "user_pain_issue_hook.rb error: " + e.message
    end
  end

end

require 'redmine'

require 'issue_patch'
require 'query_patch'
require 'user_pain_issue_hook'

Redmine::Plugin.register :redmine_redmine_user_pain do
  name 'Weave Voting Score (modified Redmine User Pain plugin)'
  author 'Theodore Biadala, modified by Andy Dufilie'
  description 'Implement User Pain bug triage'
  version '0.0.1'
  url 'https://github.com/adufilie/redmine_user_pain'
  author_url 'https://github.com/adufilie'
end


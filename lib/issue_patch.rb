require_dependency 'issue'

module RedmineUserPain
  # Patches Redmine's Issues dynamically.  Adds a +after_save+ filter.
  module IssuePatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :css_classes, :css_pain
      end
    end
    
    module InstanceMethods
      def user_pain
        score = 0;
        self.custom_values.each do |field|
          begin
            score += field.value[0] - '0'[0] # assumes value is a string that starts with a single digit
            #score += field['possible_values'].index(field.value)
          rescue
            # ignore error
          end
        end
        return score
      end

      def css_classes_with_css_pain
       s = css_classes_without_css_pain << " user_pain-#{self.user_pain}" 
       return s
      end

    end    

  end
end

Issue.send(:include, RedmineUserPain::IssuePatch)

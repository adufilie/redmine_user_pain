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
            if field.value.is_a? String and field.value.length > 0 then
              # assumes value is a string that starts with a single digit between 1 and 9
              score += field.value[0] - '0'[0] - 1
              #score += field['possible_values'].index(field.value)
            end
          rescue Exception => e
            return e.message
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

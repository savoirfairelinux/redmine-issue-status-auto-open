
require_dependency 'time_entry'

module AutoOpenIssueOfTimeEntryPatch

    def set_status_if_needed(issue, issue_status)

        if issue.status.position < issue_status.position then
            issue.init_journal User.current
            issue.status = issue_status
            issue.save!
        end

    end

    def auto_open_issue

        unless valid? then return end
        unless Setting.plugin_sfl_issue_status_auto_open['open_issue_status'] then return end

        issue_status_open = IssueStatus.find Setting.plugin_sfl_issue_status_auto_open['open_issue_status']

        if new_record? and hours > 0 then
        
            set_status_if_needed self.issue, issue_status_open

            if self.issue.parent then
                set_status_if_needed self.issue.parent, issue_status_open
            end

        end

    end

    def save(*args)
        auto_open_issue
        super
    end

    def save!(*args)
        auto_open_issue
        super
    end

end

TimeEntry.send(:include, AutoOpenIssueOfTimeEntryPatch)


require_dependency 'time_entry'

module AutoOpenIssueOfTimeEntryPatch

    def auto_open_issue
        unless valid? then return end
        issue_status_open = IssueStatus.find(Setting.plugin_sfl_issue_status_auto_open['open_issue_status'])
        if new_record? and hours > 0 and self.issue.status.position < issue_status_open.position then
            if self.issue.parent and self.issue.parent.status.position < issue_status_open.position then
                self.issue.parent.status = issue_status_open
                self.issue.parent.save!
            end
            self.issue.status = issue_status_open
            self.issue.save!
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


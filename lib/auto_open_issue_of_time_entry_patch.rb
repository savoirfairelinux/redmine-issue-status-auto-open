#
#    Copyright (C) 2014 Savoir-faire Linux Inc. (<www.savoirfairelinux.com>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
require_dependency 'time_entry'

module AutoOpenIssueOfTimeEntryPatch

    def self.included(base)
        base.class_eval do
            before_save :auto_open_issue
        end
    end

    def set_status_if_needed(issue, issue_status)

        if issue.status.position < issue_status.position then
            if issue.current_journal.nil?
                issue.init_journal User.current
                issue.send(:current_journal).send(:add_detail, 'attr', 'status', issue.status, issue_status)
                issue.send(:current_journal).save
                issue.update_column :status_id, issue_status
            else
                issue.status = issue_status
            end
        end

    end

    def auto_open_issue

        return unless Setting.plugin_redmine_issue_status_auto_open['open_issue_status']
        return if !valid? or self.issue.nil?

        issue_status_open = IssueStatus.find Setting.plugin_redmine_issue_status_auto_open['open_issue_status']

        if new_record? and hours > 0 then

            set_status_if_needed self.issue, issue_status_open

            if self.issue.parent then
                set_status_if_needed self.issue.parent, issue_status_open
            end

        end

    end

end

TimeEntry.send(:include, AutoOpenIssueOfTimeEntryPatch)

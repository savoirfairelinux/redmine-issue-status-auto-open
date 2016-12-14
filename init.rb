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
require 'redmine'
require 'auto_open_issue_of_time_entry_patch'

Redmine::Plugin.register :redmine_issue_status_auto_open do

    name 'Redmine Issue Status Auto Open'
    author 'Savoir-faire Linux'
    description 'Automatically switch status to "open" when someone spent time on a task, but also open its parent issue.'
    version '0.1.0'
    url 'https://github.com/savoirfairelinux/redmine-issue-status-auto-open'
    author_url 'https://www.savoirfairelinux.com/'

    settings :default => {
        'open_issue_status' => nil,
        :affecting_trackers => Tracker.all.pluck(:id),
    },  :partial => 'sfl_issue_status_auto_open_settings'

end

require 'redmine'

require 'auto_open_issue_of_time_entry_patch'

object_to_prepare = Rails.configuration
Redmine::Plugin.register :sfl_issue_status_auto_open do

    name 'SFL Issue Status Auto Open'
    author 'David Côté-Tremblay'
    description 'Automatically switch status to "open" when someone spent time on a task, but also open its parent issue.'
    version '0.0.1'
    url 'https://gitlab.savoirfairelinux.com/redmine/SFL-Issue-Status-Auto-Open'
    author_url 'http://savoirfairelinux.com'

    settings :default => {
        'open_issue_status' => nil,
    },  :partial => 'sfl_issue_status_auto_open_settings'

end

Redmine Issue Status Auto Open
==============================

Savoir-faire Linux
------------------

When someone spent time on a task, automatically switch it's status to open if the current status order is below.

Example :

1. Waiting for validation
2. Ready to complete
3. Open
4. In progress
5. Done
6. Rejected

If the current status is lower order than Open (the status defined in plugin settings) and someone spent time, it will automatically switch the issue status to Open.

___


Minimum system requirements
---------------------------

* GNU/Linux operating system
* Redmine >= 3.2
* Ruby on Rails >= 4.2
* Ruby >= 1.9.3
* Git >= 2.1.4


Installation procedure
----------------------

We will show you how to install it on Debian family Linux distributions (such as Ubuntu), and Redmine installed with aptitude, but it can works on many other distros with similar procedure.

You may need to do those commands as root, depending on your particular case.

Feel free to replace the variable $REDMINE_PATH to your own Redmine instance path.

```bash
$REDMINE_PATH=/usr/share/redmine/

cd $REDMINE_PATH/plugins/
git clone git@github.com:savoirfairelinux/redmine-issue-status-auto-open.git
mv redmine-issue-status-auto-open redmine_issue_status_auto_open
rake redmine:plugins:migrate RAILS_ENV=production
service apache2 reload  # or depending on which HTTP server you use

```

Configuration procedure
-----------------------

Once installed, to configure the plugin you will first need to go to `Administration -> Plugins -> Issue Status Auto Open -> Configuration`

When you're there, you have a single input to configure the plugin : The 'open' status.

![Plugin settings screenshot](https://github.com/savoirfairelinux/redmine-issue-status-auto-open/raw/master/screenshots/settings.jpg)


Contributing to this plugin
---------------------------

We absolutely appreciate patches, feel free to contribute directly on the GitHub project.

Repositories / Development website / Bug Tracker:
- https://github.com/savoirfairelinux/redmine-issue-status-auto-open

Do not hesitate to join us and post comments, suggestions, questions and general feedback directly on the issues tracker.

**Author :** David Côté-Tremblay <david.cote-tremblay@savoirfairelinux.com>
**Website :** https://www.savoirfairelinux.com/

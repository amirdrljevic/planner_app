# PLANNER APP

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  When starting on a new machine, after a fresh clone, the following lines need to be removed before running commands rails db:reset/migrate/create 
  It throws errors. after running the commands, you can restore these lines:
    #if server is offline it resets user status to offline
    config.after_initialize do |_config|
      User.update_all(status: User.statuses[:offline])
    end

* Instructions on how to rename branch

  Open the Command Palette by pressing Ctrl + Shift + P (or Cmd + Shift + P on Mac).
  Type Git: Rename Branch and select it from the options.
  Enter the new name for the branch.
  The branch will be renamed locally and remotely (if it exists on a remote repository).

* ...

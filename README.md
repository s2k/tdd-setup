# tdd-setup

Initial setup of a #Ruby project that uses RSpec for TDDing & guard to automatically run the unit tests when the file system changes.

I created this, while working on [J. B. Rainsberger's (@jbrains)](https://twitter.com/jbrains) "The World's Best Intro to TDD" online course ➙ https://online-training.jbrains.ca/p/wbitdd-01

This does the following things:

1. Checks that _one_ argument is passed in: the name of a new folder to create the new project in.
1. Checks that this folder does not yet exist (and exits with an error message otherwise).
1. Create the new folder (and possibly sub folders) as a sibling of the tdd-setup project (this one)
1. Copies the following files & folders to he newly created one:
   * `lib`
   * `spec`
   * `Gemfile`
   * `Guardfile`
   * `Rakefile`
1. Lists the newly created files & folders
1. Sets put a new git repo (running `git init` in the new folder)
1. Runs `bundle install` in that folder

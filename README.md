# Ruby code to setup a new TDD project

## GitHub actions

* [![Test TDD setup](https://github.com/s2k/tdd-setup/actions/workflows/ruby_test.yml/badge.svg)](https://github.com/s2k/tdd-setup/actions/workflows/ruby_test.yml)
* [![CodeQL for TDD setup](https://github.com/s2k/tdd-setup/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/s2k/tdd-setup/actions/workflows/codeql-analysis.yml)

Initial setup of a #Ruby project that uses RSpec for TDDing & guard to automatically run the unit tests when the file system changes.

I created this, while working on [J. B. Rainsberger's (@jbrains)](https://twitter.com/jbrains) "The World's Best Intro to TDD" online course ➙ https://online-training.jbrains.ca/p/wbitdd-01

## How to use it

Inside the directory of _this_ repository, run

    ```bash
    ruby bin/new_tdd_project.rb <new_project_name>
    ```

## What it does

1. Checks that _one_ argument is passed in: the name of a folder to create the new project in
2. Checks that this folder does not yet exist (and exits with an error message otherwise)
3. Create the new folder (and possibly sub folders) as a sibling of the tdd-setup project (this one)
4. Copies the following files & folders to he newly created one:
   * `lib`
   * `spec`
   * `Gemfile`
   * `Guardfile`
   * `Rakefile`
5. Lists the newly created files & folders
6. Sets put a new git repo (running `git init` in the new folder)
7. Runs `bundle install` in that folder

## Suggested steps after creating the setup

* Go into the newly created project directory
* Probably run
  ```bash
  bundle exec rake
  ```
  to see that `RSpec` can be run via `Rake`
  You should get output similar to this:
  ```bash
  > bundle exec rake
   # Out put informing about the version manager, RSpec, and Ruby versions used
   
   Replace with real expectation
     actually test something useful

   Finished in 0.00205 seconds (files took 0.09764 seconds to load)
   1 example, 0 failures
  ```
* Running `rspec` without `rake` should also work fine:
  ```bash
   bundle exec rspec
  ```
* At least on macOS, using `Guard` should also work:
  ```bash
  bundle exec guard

  > bundle exec guard
  13:05:36 - INFO - Guard::RSpec is running
  13:05:36 - INFO - Running all specs

  Replace with real expectation
    actually test something useful

  Finished in 0.0017 seconds (files took 0.09278 seconds to load)
  1 example, 0 failures
  ```

  In addition to the output on the command line you should also get a notification on the screen, that looks like this:

  <img src="images/rspec-results-from-guard.jpg" width="30%" alt="A notification message that Guard has sent to the OS after running RSpec">

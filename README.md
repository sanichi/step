# README

This no-database rails app is the [website](https://steachersep.org.uk/) of Scottish Teachers for Enhancing Practice.

To run/test locally:

* Install the version of ruby in `.ruby-version`.
* Run `bin/bundle install`.
* Overwrite `config/credentials.yml.enc` (it only has a `secret_key_base`) with a new `config/master.key`.
* Run the app locally on port 3000 with `bin/rails s`.
* Test by running `bin/rake`.

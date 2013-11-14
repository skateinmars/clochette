# Clochette

Receive and dispatch web hooks.

## Installation

The project is built on top of Sinatra.

### Prerequisites

**Ruby 2.0.0**

### Configuring

    git clone https://github.com/skateinmars/clochette.git
    cd clochette
    bundle install

Then set up your environment variables (you can use a .env file).
Currently the needed variables are:
    TRELLO_DEVELOPER_PUBLIC_KEY
    TRELLO_MEMBER_TOKEN
    TRELLO_BOARD
    TRELLO_FINISHED_LIST

## Running the project

    bundle exec foreman start

## Running the test suite

Run the full test suite (specs + code quality thresholds):

    bundle exec rake

Run specs:

    bundle exec rake spec

When running the test suite, a test coverage report is generated in coverage/index.html.

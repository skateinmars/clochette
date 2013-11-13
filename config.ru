require 'bundler/setup'
Bundler.require

require File.join(File.dirname(__FILE__), 'lib', 'clochette')

run Clochette::Application

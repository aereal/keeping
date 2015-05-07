#!rackup

root = File.expand_path(__dir__)
lib = File.join(root, 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'keeping/web/app'

run Keeping::Web::App

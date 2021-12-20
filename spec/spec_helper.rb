require 'rspec'
require 'pg'
require 'artist'
require 'stage'
require 'pry'


DB = PG.connect({:dbname => "festival_database_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stages *;")
    DB.exec("DELETE FROM artists *;")
  end
end
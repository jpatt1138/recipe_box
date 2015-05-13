
# require("bundler/setup")
# Bundler.require(:default, :test)

require('capybara/rspec')
require('sinatra/activerecord')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
    Ingredient.all().each() do |ingredient|
      ingredient.destroy()
    end

  end
end

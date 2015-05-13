ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
 require('./app')
 Capybara.app = Sinatra::Application
 set(:show_exceptions, false)


describe('the adding of recipes', {:type => :feature}) do
  it("adds a recipe to the database") do
    visit('/')
    fill_in("recipe", :with => "BBQ wings")
    select('BBQ', :from => 'category')
    fill_in("ingredients", :with => "chicken wings; BBQ sauce")
    fill_in("instructions", :with => "cook em up!")
    click_button('Save')
    expect(page).to have_content("BBQ wings")
  end
end

describe('the looking at of recipe', {:type => :feature}) do
  it("looks up a particular recipe") do
    visit('/')
    fill_in("recipe", :with => "BBQ wings")
    select('BBQ', :from => 'category')
    fill_in("ingredients", :with => "chicken wings; BBQ sauce")
    fill_in("instructions", :with => "cook em up!")
    click_button('Save')
  end
end

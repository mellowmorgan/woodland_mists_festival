require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a stage path', {:type => :feature}) do
  it('creates a stage and then goes to the stage page') do
    visit('/stages')
    click_on('Add a new stage')
    fill_in('stage_name', :with => 'Warped Stage')
    click_on('Go!')
    expect(page).to have_content('Warped Stage')
  end
end

describe('create an artist path', {:type => :feature}) do
  it('creates an artist and then goes to the artist page') do
    visit('/stages')
    click_on('Warped Stage')
    fill_in('artist_name', :with => 'Shania Twain')
    click_on('Add Artist')
    expect(page).to have_content('Shania Twain')
  end
end

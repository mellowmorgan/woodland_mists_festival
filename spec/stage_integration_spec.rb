require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('create a stage path', {:type => :feature}) do
#   it('creates a stage and then goes to the stage page') do
#     visit('/stages')
#     click_on('Add a new stage')
#     fill_in('stage_name', :with => 'Warped Stage')
#     click_on('Go!')
#     expect(page).to have_content('Warped Stage')
#   end
# end

# describe('create an artist path', {:type => :feature}) do
#   it('creates an artist and then goes to the artist page') do
#     visit('/stages')
#     click_on('Warped Stage')
#     fill_in('artist_name', :with => 'Shania Twain')
#     click_on('Add Artist')
#     expect(page).to have_content('Shania Twain')
#   end
# end

# describe('edit a stage path', {:type => :feature}) do
#   it('creates a stage and then goes to the stage page and then edits the stage') do
#     visit('/stages')
#     click_on('Add a new stage')
#     fill_in('stage_name', :with => 'Fish Stage')
#     click_on('Go!')
#     click_on('Fish Stage')
#     fill_in('stage_name', :with => 'Dino Stage')
#     click_on('Edit stage')
#     expect(page).to have_content('Dino Stage')
#     expect(page).to have_no_content('Fish Stage')
#   end
# end

# describe('create an artist path', {:type => :feature}) do
#   it('creates a stage and then goes to the stage page and then deletes the stage') do
#     visit('/stages')
#     click_on('Add a new stage')
#     fill_in('stage_name', :with => 'Oak Stage')
#     click_on('Go!')
#     click_on('Oak Stage')
#     click_on('Delete stage')
#     expect(page).to have_no_content('Oak Stage')
#   end
# end


require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages/new') do
  erb(:new_stage)
end

get('/stages/:id') do
  @stage = Stage.find(params[:id].to_i)
  erb(:stage)
end

post('/stages') do
  name = params[:stage_name]
  stage = Stage.new(name, nil)
  stage.save
  @stages = Stage.all
  erb(:stages)
end
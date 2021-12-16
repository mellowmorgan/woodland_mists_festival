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

post('/stages/:id/artists') do
  @stage = Stage.find(params[:id].to_i)
  name = params[:artist_name]
  artist = Artist.new(name, @stage.id, nil)
  artist.save
  @artists = Artist.all
  erb(:stage)
end

get('/stages/:id/artists/:artist_id') do
  @artist = Artist.find(params[:artist_id].to_i())
  erb(:artist)
end

delete('/stages/:id') do
  stage = Stage.find(params[:id].to_i)
  stage.delete
  @stages = Stage.all
  erb(:stages)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i)
  @stage.update(params[:stage_name])
  @stages = Stage.all
  erb(:stage)
end
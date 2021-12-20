require 'artist'
require 'stage'
require 'spec_helper'

describe ('#Artist') do

before(:each) do
  @stage = Stage.new({:name => "North Stage", :id => nil})
  @stage.save()
end

  describe('#save') do
    it("should add artist with stage id to to artists") do
      artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist.save
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('#==') do
    it("should make two artists equal") do
      artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist.save
      artist2 = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist2.save
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("should return all artists") do
      artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist.save
      artist2 = Artist.new({:name => "Chuck Berry", :stage_id => @stage.id, :id => nil})
      artist2.save
      expect(Artist.all()).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("should clear all artists") do
      artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist.save
      artist2 = Artist.new({:name => "Chuck Berry", :stage_id => @stage.id, :id => nil})
      artist2.save
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.find') do
    it("should find an artist by id") do
      artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist.save
      artist2 = Artist.new({:name => "Chuck Berry", :stage_id => @stage.id, :id => nil})
      artist2.save
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe("#update") do
    it("should update an artist") do
      artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
      artist.save
      artist.update("Chuck Berry", @stage.id)
      expect(Artist.all).to(eq([artist]))
      expect(artist.name).to(eq("Chuck Berry"))
    end
  end

  describe('#delete') do
  it("deletes an song by id") do
    artist = Artist.new({:name => "Katy Perry", :stage_id => @stage.id, :id => nil})
    artist.save()
    artist2 = Artist.new({:name => "Chuck Berry", :stage_id => @stage.id, :id => nil})
    artist2.save()
    artist.delete()
    expect(Artist.all).to(eq([artist2]))
  end
end

  describe('.find_by_stage') do
    it("finds an artist by their stage by stage id") do
      stage2 = Stage.new({:name => "South Stage", :id => nil})
      stage2.save
      artist2 = Artist.new({:name => "Chuck Berry", :stage_id => stage2.id, :id => nil})
      artist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
    end
  end

  describe('#stage') do
    it("finds the stage an artist belongs to") do
      stage2 = Stage.new({:name => "South Stage", :id => nil})
      stage2.save
      artist = Artist.new({:name => "Katy Perry", :stage_id => stage2.id, :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Chuck Berry", :stage_id => stage2.id, :id => nil})
      artist2.save()
      expect(artist2.stage).to(eq(stage2))
    end
  end
end


require 'rspec'
require 'artist'
require 'stage'
require 'pry'

describe ('#Artist') do

before(:each) do
  Stage.clear()
  Artist.clear()
  @stage = Stage.new("North Stage", nil)
  @stage.save()
end

  describe('#save') do
    it("should add artist with stage id to to artists") do
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('#==') do
    it("should make two artists equal") do
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save
      artist2 = Artist.new("Katy Perry", @stage.id, nil)
      artist2.save
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("should return all artists") do
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save
      artist2 = Artist.new("Chuck Berry", @stage.id, nil)
      artist2.save
      expect(Artist.all()).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("should clear all artists") do
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save
      artist2 = Artist.new("Chuck Berry", @stage.id, nil)
      artist2.save
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.find') do
    it("should find an artist by id") do
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save
      artist2 = Artist.new("Chuck Berry", @stage.id, nil)
      artist2.save
      expect(Artist.find(2)).to(eq(artist2))
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe("#update") do
    it("should update an artist") do
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save
      artist.update("Chuck Berry", @stage.id)
      expect(Artist.all).to(eq([artist]))
      expect(artist.name).to(eq("Chuck Berry"))
    end
  end

  describe('#delete') do
  it("deletes an song by id") do
    artist = Artist.new("Katy Perry", @stage.id, nil)
    artist.save()
    artist2 = Artist.new("Chuck Berry", @stage.id, nil)
    artist2.save()
    artist.delete()
    expect(Artist.all).to(eq([artist2]))
  end
end

  describe('.find_by_stage') do
    it("finds an artist by their stage by stage id") do
      stage2 = Stage.new("South Stage", nil)
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chuck Berry", stage2.id, nil)
      artist2.save()
      expect(Artist.find_by_stage(1)).to(eq([artist]))
      expect(Artist.find_by_stage(@stage.id)).to(eq([artist]))
    end
  end

  describe('#stage') do
    it("finds the stage an artist belongs to") do
      stage2 = Stage.new("South Stage", nil)
      stage2.save
      artist = Artist.new("Katy Perry", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chuck Berry", stage2.id, nil)
      artist2.save()
      expect(artist2.stage).to(eq(stage2))
    end
  end
end


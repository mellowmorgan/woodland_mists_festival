class Artist
  attr_reader :id
  attr_accessor :name, :stage_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stage_id = attributes.fetch(:stage_id)
    @id = attributes.fetch(:id)
  end

  def ==(artist_to_compare)
    (self.name() == artist_to_compare.name()) && (self.stage_id() == artist_to_compare.stage_id())
  end

  def self.all
    returned_artist = DB.exec("SELECT * FROM artists")
  end

  def save
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def self.find(id)
    @@artists[id]
  end

  def update(name, stage_id)
    self.name = name
    self.stage_id = stage_id
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def delete
    @@artists.delete(self.id)
  end

  def self.clear
    @@artists = {}
    @@total_rows = 0
  end

  def self.find_by_stage(st_id)
    artists = []
    @@artists.values.each do |artist|
      if artist.stage_id == st_id
        artists.push(artist)
      end
    end
    artists
  end

  def stage
    Stage.find(self.stage_id)
  end
end
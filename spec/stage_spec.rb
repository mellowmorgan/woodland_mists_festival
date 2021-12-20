require 'stage'
require 'spec_helper'

describe ('#Stage') do 
  describe('.all') do
    it('should return all stages') do
      stage1 = Stage.new({:name => "South Stage", :id => nil})
      stage1.save
      stage2 = Stage.new({:name => "North Stage", :id => nil})
      stage2.save
      expect(Stage.all).to(eq([stage1, stage2]))
    end
  end

  describe('#==') do
    it('two objects with same name equal each other') do
      stage1 = Stage.new({:name => "South Stage", :id => nil})
      stage2 = Stage.new({:name => "South Stage", :id => nil})
      expect(stage1).to(eq(stage2))
    end
  end

  describe('.clear') do
    it('should clear out all of database') do
      stage1 = Stage.new({:name => "South Stage", :id => nil})
      stage1.save
      stage2 = Stage.new({:name => "South Stage", :id => nil})
      stage2.save
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#update') do
    it('should update a stage by its id') do
      stage1 = Stage.new({:name => "South Stage", :id => nil})
      stage1.save
      stage1.update("North Stage")
      expect(stage1.name).to(eq("North Stage"))
    end
  end

  describe('.find') do
    it('should find a stage by its id') do
      stage1 = Stage.new({:name => "South Stage", :id => nil})
      stage1.save
      stage2 = Stage.new({:name => "South Stage", :id => nil})
      stage2.save
      expect(Stage.find(stage1.id)).to(eq(stage1))
    end
  end

  describe('#delete') do
    it('should delete a stage by its id') do
      stage1 = Stage.new({:name => "South Stage", :id => nil})
      stage1.save
      stage2 = Stage.new({:name => "South Stage", :id => nil})
      stage2.save
      stage1.delete
      expect(Stage.all).to(eq([stage2]))
    end
  end
end

require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'should not save idea without name' do
    idea = Idea.new(description: 'test')
    assert_not idea.save
  end

  test 'should not save idea without description' do
    idea = Idea.new(name: 'test')
    assert_not idea.save
  end

  test 'should not save idea without name and description' do
    idea = Idea.new
    assert_not idea.save
  end

  test 'should save idea with name and description' do
    idea = Idea.new(name: 'idea 1', description: 'first idea')
    assert idea.save
  end
end

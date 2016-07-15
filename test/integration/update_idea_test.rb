require 'test_helper'

class UpdateIdeaTest < ActionDispatch::IntegrationTest
  setup do
    @idea = ideas(:idea_1)
  end

  test "can see all ideas" do
    get "/"
    assert_select "h1", "Experimental Ideas"
    assert_select "a", "Idea 1"
  end

  test "can edit an existind idea" do
    get "/ideas/#{@idea.id}/edit"
    assert_response :success
    assert_select "h1", "Editing Idea"

    put "/ideas/#{@idea.id}", params: { idea: { name: "An Idea", description: "Brainwave I" } }
    assert_response :redirect
    follow_redirect!

    assert_response :success
    assert_equal "Idea was successfully updated.", flash[:notice]
    assert_select "h4", "An Idea"
    assert_select "p", "Brainwave I"
  end
end

require 'test_helper'

class CreateIdeaTest < ActionDispatch::IntegrationTest
  test "can see all ideas" do
    get "/"
    assert_select "h1", "Experimental Ideas"
  end

  test "can add new idea" do
    get "/ideas/new"
    assert_response :success
    assert_select "h1", "New Idea"

    post "/ideas", params: { idea: { name: "idea 1", description: "first idea" } }
    assert_response :redirect
    follow_redirect!

    assert_response :success
    assert_equal "Idea was successfully created.", flash[:notice]
    assert_select "h4", "idea 1"
    assert_select "p", "first idea"
  end
end

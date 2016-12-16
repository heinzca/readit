require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "creates vote" do                            #This is falling over. URL Generation error. Look into.
    assert_difference 'stories(:two).votes.count' do
      post story_votes_path(stories(:two))
    end
  end
  test "create vote with ajax" do
    post story_votes_path(stories(:two)), xhr: true
    assert_response :success
  end
end

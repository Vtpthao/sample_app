require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    
    @micropost = microposts(:Lorem )
    @commnet = Micropost.new(content: "test commnet", user_id: @user.id, 
    							micropost_id: @micropos.id)

  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @commnet.user_id = nil
    @commnet.micropost_id = nil
    assert_not @commnet.valid?
  end
  test "content should be present" do
    @commnet.content = "   "
    assert_not @commnet.valid?
  end

  test "content should be at most 140 characters" do
    @commnet.content = "a" * 141
    assert_not @commnet.valid?
  end
test "order should be most recent first" do
    assert_equal comments(:most_recent), Comment.first
  end
end

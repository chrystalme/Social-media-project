require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  describe User do
  context 'association' do
    should have_many (:posts)
  end
end
end

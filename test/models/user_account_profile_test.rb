# == Schema Information
#
# Table name: user_account_profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  nickname     :string
#  introduction :text
#  user_gender  :integer
#  birthday     :date
#  subscribed   :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_account_profiles_on_user_id  (user_id)
#

require "test_helper"

class UserAccountProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

class Follow < ActiveRecord::Base
	validates :follower_id, uniqueness: {scope: :followee_id}
end

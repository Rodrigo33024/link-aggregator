class CommunityLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  validates_presence_of :title, :link, :channel_id
end

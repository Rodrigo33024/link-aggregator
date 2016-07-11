# community links model
class CommunityLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  validates_presence_of :title, :link, :channel_id

  before_validation :approved_trusted

  def approved_trusted
    self.approved = true if user.trusted?
  end
end

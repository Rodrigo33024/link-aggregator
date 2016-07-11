# community links controller
class CommunityLinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @community_links = CommunityLink.includes(:channel, :user)
                                    .where(approved: true)
    @community_link = CommunityLink.new
  end

  def create
    @community_link = CommunityLink.new(community_links_params)
    @community_link.user_id = current_user.id

    if @community_link.save
      redirect_to(:back)
    else
      flash[:danger] = 'We couldn\'t save the link'
      redirect_to root_path
    end
  end

  private

  def community_links_params
    params.require(:community_link).permit(:title, :link, :channel_id)
  end
end

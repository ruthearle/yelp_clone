class EndorsementsController < ApplicationController

  include ActionView::Helpers::TextHelper

  def create
    @review = Review.find(params[:review_id])
    @review.endorsements.create
    # the following line works with js to prevent page reloading on click whilst updating our db (ajax baby!)
    render json: {new_endorsement_count: "#{pluralize(@review.endorsements.count, 'endorsement')}"}


  end
end

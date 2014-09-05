class LatestUsersSetupController < ApplicationController
  unloadable


  def index

    setup = LatestUsersSetup.find_by_id(1)
    if setup == nil
      setup = LatestUsersSetup.create(:max_count => LatestUsersSetup::DEFAULT_COUNT, :side => LatestUsersSetup::DEFAULT_SIDE)
    end
    @setup = setup
  end

  def change
    setup = LatestUsersSetup.find_by_id(1)
    setup.max_count = params[:count]
    setup.side  = params[:side]
    if setup.save
      flash[:notice] = 'Latest users setup saved.'
    end
    redirect_to :action => 'index'
  end
end

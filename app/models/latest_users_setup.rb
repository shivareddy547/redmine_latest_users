class LatestUsersSetup < ActiveRecord::Base
  unloadable
  attr_accessible :max_count,:side
  DEFAULT_COUNT = 10
  DEFAULT_SIDE = 'left'

end

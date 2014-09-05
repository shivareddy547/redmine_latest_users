class LatestUsersViewHookListener < Redmine::Hook::ViewListener

  require File.join(File.dirname(__FILE__), '../../app/models/latest_users_setup')

  def view_welcome_index_left(context={})
    setup = load_setup()

    if setup[:side] == "left"
      load_issues(setup[:count])
    end
  end

  def view_welcome_index_right(context={})
    setup = load_setup()
    if setup[:side] == "right"
      load_issues(setup[:count])
    end
  end

  def load_setup()

    setup = LatestUsersSetup.find_by_id(1)

    if setup == nil
      count = LatestUsersSetup::DEFAULT_COUNT
      side  = LatestUsersSetup::DEFAULT_SIDE
    else
      count = setup.max_count
      side  = setup.side
    end



    {:count => count, :side => side}
  end

  def load_issues(count)
    html = '<div class="box" id="statuses">'
    html += '<h3 class="icon22 icon22-users">Latest Users</h3><ul>'
    users  = User.limit(count).order('created_on DESC')
    users.each do |user|
      html += <<EOHTML
                  <li>
                      #{link_to h(truncate(user.firstname, :length => 60)), :controller => 'users', :action => 'show', :id => user } (#{ format_time(user.created_on)})
                                         </li>
EOHTML
    end
    html += '</ul></div>'
    return html
  end
end
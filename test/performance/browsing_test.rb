require 'test_helper'
require 'rails/performance_test_help'

class BrowsingTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def test_homepage
    get '/'
  end

  def test_users
    get '/users/index'
    get '/login'
    get '/register'
  end

  def test_carriages
    get '/carriages/index'
    get '/carriages/view/110101123456'
  end
end

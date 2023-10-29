require 'test_helper'

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get weather_index_url
    assert_response :success
  end

  test 'should get info' do
    get weather_info_url(id: 'test')
    assert_response :success
  end
end

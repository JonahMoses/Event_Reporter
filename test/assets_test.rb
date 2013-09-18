require 'minitest'
require 'minitest/autorun'
require './lib/assets'

class AssetsTest < MiniTest::Test

  def test_if_assets_data_exists
    ad = Assets.new
    assert_kind_of Assets, ad
  end
  
  def test_contents_are_correctly_loaded_from_valid_csv
    filename = "./event_attendees.csv"
    assets = Assets.new

    assets.open_file(filename)    
    contents = assets.contents
    assert_equal "20010", contents[:zipcode].first
  end


end


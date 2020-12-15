require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require './lib/show'
require './lib/character'

class NetworkTest < MiniTest::Test

  def test_it_exists
    nbc = Network.new("NBC")
    assert_instance_of Network, nbc
  end

  def test_it_has_name
    nbc = Network.new("NBC")

    assert_equal "NBC", nbc.name
  end

  def test_it_has_no_shows
    nbc = Network.new("NBC")

    assert_equal [], nbc.shows
  end

  def test_it_has_shows
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    assert_equal [knight_rider, parks_and_rec], nbc.shows
  end

  def test_it_has_main_characters
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    assert_equal [michael_knight,leslie_knope], nbc.main_characters
  end
end



#
# pry(main)> nbc.main_characters
# # => [#<Character:0x00007f98a4ba8dc8...>]
#
# pry(main)> nbc.actors_by_show
# # => {
#       #<Show:0x00007fe5f8398970...> => ["David Hasselhoff", "William Daniels"],
#       #<Show:0x00007fe5f88b0a20...> => ["Amy Poehler", "Nick Offerman"]
# #    }

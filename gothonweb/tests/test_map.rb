require "./lib/gothonweb/map.rb"
require "test/unit"

class TestMap < Test::Unit::TestCase
  def test_room()
    gold = Map::Room.new("GoldMap::Room",
                """ This room has gold in it you can grab. There's a
                door to the north.""")
    assert_equal(gold.name, "GoldMap::Room")
    assert_equal(gold.paths, {})
  end

  def test_room_paths()
    center = Map::Room.new("Center", "Test room in the center.")
    north = Map::Room.new("North", "Test room in the north.")
    south = Map::Room.new("South", "Test room in the south.")

    center.add_paths({'north' => north, 'south' => south})
    assert_equal(center.go('north'), north)
    assert_equal(center.go('south'), south)
  end

  def test_map()
    start = Map::Room.new("Start", "You can go west and down a hole.")
    west = Map::Room.new("Trees", "There are trees here, you can go east.")
    down = Map::Room.new("Dungeon", "It's dark down here, you can go up.")

    start.add_paths({'west' => west, 'down' => down})
    west.add_paths({'east' => start})
    down.add_paths('up' => start)

    assert_equal(start.go('west'), west)
    assert_equal(start.go('west').go('east'), start)
    assert_equal(start.go('down').go('up'), start)
  end

  def test_gothon_game_map()
    assert_equal(Map::START.go('shoot!'), Map::GENERIC_DEATH)
    assert_equal(Map::START.go('dodge!'), Map::GENERIC_DEATH)

    room = Map::START.go('tell a joke')
    assert_equal(room, Map::LASER_WEAPON_ARMORY)

    # complete this by making it play the game
    room = Map::LASER_WEAPON_ARMORY
    assert_equal(room.go('*'), Map::GENERIC_DEATH)
    assert_equal(room.go('0132'), Map::THE_BRIDGE)

    room = Map::THE_BRIDGE
    assert_equal(room.go('throw the bomb'), Map::GENERIC_DEATH)
    assert_equal(room.go('slowly place the bomb'), Map::ESCAPE_POD)

    room = Map::ESCAPE_POD
    assert_equal(room.go('*'), Map::THE_END_LOSER)
    assert_equal(room.go('2'), Map::THE_END_WINNER)
  end

  def test_session_loading()
    session = {}

    room = Map::load_room(session)
    assert_equal(room, nil)

    Map::save_room(session, Map::START)
    room = Map::load_room(session)
    assert_equal(room, Map::START)

    room = room.go('tell a joke')
    assert_equal(room, Map::LASER_WEAPON_ARMORY)

    Map::save_room(session, room)
    assert_equal(room, Map::LASER_WEAPON_ARMORY)
  end
end

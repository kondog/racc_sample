require 'test/unit'
require './parse.rb'

class TestParser < Test::Unit::TestCase
  def test_semantic_check
    # test equal pattern.
    assert_equal(true,  semantic_check([[1, 1, :equal]]))
    assert_equal(false, semantic_check([[1, 2, :equal]]))

    # test add pattern.
    assert_equal(true,  semantic_check([[2, [1, 1, :add], :equal]]))
    assert_equal(false, semantic_check([[3, [1, 1, :add], :equal]]))

    # test add duplicate pattern.
    assert_equal(true,  semantic_check([[3, [1, [1, 1, :add], :add], :equal]]))
    assert_equal(false, semantic_check([[3, [1, [2, 1, :add], :add], :equal]]))
  end
end

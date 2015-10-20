require "ex48/parser.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase
  def testPeek()
    assert_equal(Parser.peek([['verb', 'eat'], ['noun', 'bear']]), 'verb')
  end

  def testMatch()
    assert_equal(Parser.match([['verb', 'eat']], 'verb'), ['verb', 'eat'])
  end

  def testParseVerb()
    assert_equal(Parser.parse_verb([['stop', 'of'], ['verb', 'eat']]),
                                    ['verb', 'eat'])
  end

  def testParseSubject()
    assert_equal(Parser.parse_subject([['stop', 'of'],['noun', 'bear']]),
                                      ['noun', 'bear'])
  end

  def testParseObject()
    assert_equal(Parser.parse_object([['stop', 'of'],['noun', 'bear']]),
                                      ['noun', 'bear'])
  end
end

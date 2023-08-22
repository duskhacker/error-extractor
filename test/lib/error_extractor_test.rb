require_relative "../test_helper"

class Array
  def to_sentence
    self.join(", ")
  end

  def full_messages
    self
  end
end

class MockRespondsToRecord
  def record
    self
  end

  def errors
    ["error 1", "error 2", "error 3"]
  end

  def message
    "here is an error message"
  end
end

class MockRespondsToMessage
  def message
    "here is an error message"
  end
end

class MockRespondsToToS
  def to_s
    "a Mock message"
  end
end

class Mock
end

class MockWithBackTrace
  def backtrace
    ["backtrace line 1", "backtrace line 2"]
  end
end

class ErrorExtractorTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::ErrorExtractor::VERSION
  end

  def test_extract_errors_from_record
    assert_equal "error 1, error 2, error 3", extract_errors(MockRespondsToRecord.new)
  end

  def test_extract_errors_from_message
    assert_equal "here is an error message", extract_errors(MockRespondsToMessage.new)
  end

  def test_extract_errors_from_object_from_to_s
    assert_equal "a Mock message", extract_errors(MockRespondsToToS.new)
  end

  def test_extract_errors_from_object
    assert_match /#<Mock:/, extract_errors(Mock.new)
  end

  def test_extract_errors_with_backtrace
    assert_match /#<MockWithBackTrace:.*?>\nbacktrace line 1\nbacktrace line 2/,
      extract_errors_with_backtrace(MockWithBackTrace.new)
  end
end

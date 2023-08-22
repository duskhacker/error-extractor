require_relative "error_extractor/version"

module ErrorExtractor

  def self.included(base)
    base.extend ClassMethods
  end

  def extract_errors(e)
    self.class.extract_errors(e)
  end

  def extract_errors_with_backtrace(e)
    self.class.extract_errors_with_backtrace(e)
  end

  module ClassMethods
    def extract_errors(e)
      if e.respond_to?(:record) && __present?(e.record) && __present?(e.record&.errors&.full_messages&.to_sentence)
        e.record.errors.full_messages.to_sentence
      elsif e.respond_to?(:message)
        e.message
      elsif e.respond_to?(:to_s)
        e.to_s
      else
        e
      end
    end

    def extract_errors_with_backtrace(e)
        "#{extract_errors(e)}\n" +
        "#{e.respond_to?(:backtrace) ? e.backtrace.join("\n") : ""}"
    end
  end

  private

  def __present?(o)
    !o.nil? && o != ""
  end
end

include ErrorExtractor

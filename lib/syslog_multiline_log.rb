require "syslog_multiline_log/version"

class SyslogMultilineLog
  def initialize(text)
    @text = text
  end

  def to_s
    lines = @text.split("\n")
    return @text if lines.size == 1

    lines.map.with_index do |line, i|
      "[#{i + 1}/#{lines.count}] #{line}"
    end.join("\n")
  end
end

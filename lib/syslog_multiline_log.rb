require "syslog_multiline_log/version"

class SyslogMultilineLog
  def initialize(text)
    @text = text
  end

  def to_s
    lines = @text.split(/\r?\n/)
    return @text if lines.size == 1

    lines.map.with_index do |line, i|
      "[%0#{lines.count.to_s.size}d/#{lines.count}] #{line}\n" % [i+1]
    end.join
  end
end

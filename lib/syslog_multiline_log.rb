require "syslog_multiline_log/version"

class SyslogMultilineLog
  def initialize(text)
    @text = text
  end

  def to_s
    @text
  end
end

describe SyslogMultilineLog do
  describe '#to_s' do
    context "log doesn't have multiple lines" do
      it 'returns the log text' do
        text = 'A log entry'
        syslog_multiline_log = SyslogMultilineLog.new(text)
        expect(syslog_multiline_log.to_s).to eq(text)
      end
    end

    it 'tags each line of the log with numbers' do
      # TODO: Move it to a fixture?
      text = <<-eos
First line in a log
Second line in the log
eos
      syslog_multiline_log = SyslogMultilineLog.new(text.rstrip)
      string = <<-eos
[1/2] First line in a log
[2/2] Second line in the log
eos
      expect(syslog_multiline_log.to_s).to eq(string.rstrip)
    end

    it 'pads smaller numbers with 0s' do
      text = <<-eos
First line in a log
Second line in the log
Third line in the log
Fourth line in the log
Fifth line in the log
Sixth line in the log
Seventh line in the log
Eighth line in the log
Ninth line in the log
Tenth line in the log
eos
      syslog_multiline_log = SyslogMultilineLog.new(text.rstrip)
      string = <<-eos
[01/10] First line in a log
[02/10] Second line in the log
[03/10] Third line in the log
[04/10] Fourth line in the log
[05/10] Fifth line in the log
[06/10] Sixth line in the log
[07/10] Seventh line in the log
[08/10] Eighth line in the log
[09/10] Ninth line in the log
[10/10] Tenth line in the log
eos
      expect(syslog_multiline_log.to_s).to eq(string.rstrip)
    end

    it 'ignores carriage returns' do
      text = "First line in a log\r\nSecond line in the log"
      syslog_multiline_log = SyslogMultilineLog.new(text.rstrip)
      string = <<-eos
[1/2] First line in a log
[2/2] Second line in the log
eos
      expect(syslog_multiline_log.to_s).to eq(string.rstrip)
    end
  end
end

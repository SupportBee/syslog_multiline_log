describe SyslogMultilineLog do
  describe '#to_s' do
    it 'tags each line of the log with numbers' do
      # TODO: Move it to a fixture
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

    context "log doesn't have multiple lines" do
      it 'returns the log text' do
        text = 'A log entry'
        syslog_multiline_log = SyslogMultilineLog.new(text)
        expect(syslog_multiline_log.to_s).to eq(text)
      end
    end
  end
end

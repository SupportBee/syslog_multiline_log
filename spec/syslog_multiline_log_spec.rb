describe SyslogMultilineLog do
  describe '#to_s' do
    context "log doesn't have multiple lines" do
      it 'returns the log text' do
        text = 'A log entry'
        syslog_multiline_log = SyslogMultilineLog.new(text)
        expect(syslog_multiline_log.to_s).to eq(text)
      end
    end
  end
end

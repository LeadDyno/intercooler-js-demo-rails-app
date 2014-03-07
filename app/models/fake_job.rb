class FakeJob

  def initialize(info = {})
    info[:started_at] ||= Time.now()
    info[:finishes_at] ||= info[:started_at] + (10..15).to_a.sample.seconds
    @info = info
  end

  def percent_str
    "#{'%.2f' % percent}%"
  end

  def percent
    total_time = @info[:finishes_at] - @info[:started_at]
    running_time = Time.now() - @info[:started_at]
    [running_time/total_time * 100.0, 100.0].min
  end

  def status
    if complete?
      'Finished'
    else
      "Running: #{percent_str} done"
    end
  end

  def clear
    @info[:started_at] = @info[:finishes_at] = nil
  end

  def complete?
    percent >= 100.0
  end

  def self.find(session)
    if session[:started_at]
      FakeJob.new(session)
    end
  end

end
class JobController < ApplicationController

  def index
    @job = FakeJob.find(session)
  end

  def status
    if request.get?
    # returns the job running UI
      @job = FakeJob.find(session)
      render partial:'status'
    elsif request.post?
      # starts a new job, lets dependencies take care of refresh
      @job = FakeJob.new(session)
      render nothing: true
    elsif request.delete?
      # clears the job, lets dependencies take care of refresh
      @job = FakeJob.find(session).clear()
      render nothing: true
    end
  end

  def status_txt
    # simply returns the current status
    render inline: FakeJob.find(session).status
  end

  def status_percent
    @job = FakeJob.find(session)
    # If the job is complete, force the outer UI to refresh via a dependency
    response.headers['X-IC-Refresh'] = '/job' if @job.complete?
    render inline: @job.percent_str
  end

end
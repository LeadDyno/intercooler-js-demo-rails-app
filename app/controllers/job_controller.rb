class JobController < ApplicationController

  def index
    @job = FakeJob.find(session)
  end

  def status
    if request.get?
      @job = FakeJob.find(session)
      render partial:'status'
    elsif request.post?
      @job = FakeJob.new(session)
      render nothing: true
    elsif request.delete?
      @job = FakeJob.find(session).clear()
      render nothing: true
    else
      render nothing: true
    end
  end

  def status_txt
    @job = FakeJob.find(session)
    render inline: @job.status
  end

  def status_percent
    @job = FakeJob.find(session)
    response.headers['X-IC-Refresh'] = '/job' if @job.complete?
    render inline: FakeJob.find(session).percent_str
  end

end
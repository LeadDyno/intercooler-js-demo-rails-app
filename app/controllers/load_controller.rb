class LoadController < ApplicationController

  include RubyHackernews

  def index
    @page = params['page'] ? params['page'].to_i : 1
    @entries = Entry.all(@page)
    @entries = @entries[-30..-1]
    render :layout => params['ic-request'] != 'true'
  end

  def infinite
    @page = params['page'] ? params['page'].to_i : 1
    @entries = Entry.all(@page)
    @entries = @entries[-30..-1]
    render :layout => params['ic-request'] != 'true'
  end

  def infinite_table
    @page = params['page'] ? params['page'].to_i : 1
    @entries = Entry.all(@page)
    @entries = @entries[-30..-1]
    render :layout => params['ic-request'] != 'true'
  end

end
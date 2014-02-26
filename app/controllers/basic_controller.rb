class BasicController < ApplicationController

  def index
    session[:counter] ||=0
    render layout: params['ic-request'].blank?
  end

  def counter
    if request.post?
      sleep(2)
      session[:counter] ||=0
      session[:counter] += 1
      render nothing:true
    elsif request.delete?
      session[:counter] = 0
      render nothing:true
    else
      render partial: 'basic/counter'
    end
  end



end
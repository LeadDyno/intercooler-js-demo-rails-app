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
      render inline: ''
    elsif request.delete?
      session[:counter] = 0
      render inline: ''
    else
      render partial: 'basic/counter'
    end
  end



end
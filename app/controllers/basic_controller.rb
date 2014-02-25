class BasicController < ApplicationController

  def index
    session[:counter] ||=0
    render layout: params['ic-request'].blank?
  end

  def reset_counter
    session[:counter] = 0
    render inline: ''
  end

  def inc_counter
    sleep(2)
    session[:counter] ||=0
    session[:counter] += 1
    render inline: ''
  end

  def counter
    render partial:'basic/counter'
  end

end
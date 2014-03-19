class BasicController < ApplicationController

  def index
    session[:counter] ||=0
    render layout: params['ic-request'].blank?
  end

  def click
    render inline:"You clicked at #{ DateTime.now }"
  end

  def counter
  end

  def spinner
  end

  def count
    if request.post?
      if params[:delay]
        sleep(params[:delay].to_i)
      end
      session[:counter] ||=0
      session[:counter] += 1
      render nothing:true
    elsif request.delete?
      session[:counter] = 0
      render nothing:true
    else
      render partial: 'basic/count'
    end
  end

  def script
    if request.post?
      response.headers['X-IC-Script'] = "alert('Hello! This is a script from the server side!');"
      render nothing:true
    end
  end

  def flash_demo
  end

end
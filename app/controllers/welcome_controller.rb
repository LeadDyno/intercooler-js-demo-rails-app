class WelcomeController < ApplicationController

  def index
    render layout: params['ic-request'].blank?
  end

  def script
    response.headers['X-IC-Script'] = "alert('Hello! This is a script from the server side!');"
    render nothing:true
  end

  def flash_div
    render :partial => 'layouts/flash'
  end

  def flash_notice
    flash[:notice] = 'Here is a notice...'
    render nothing:true
  end

  def flash_alert
    flash[:alert] = 'Here is an alert...'
    render nothing:true
  end

end
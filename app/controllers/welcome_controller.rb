class WelcomeController < ApplicationController

  def index
  end

  def script
    response.headers['X-ic-script'] = "alert('Hello! This is a script from the server side!');"
    render inline: ''
  end

  def flash_div
    render :partial => 'layouts/flash'
  end

  def flash_notice
    flash[:notice] = 'Here is a notice...'
    render inline: ''
  end

  def flash_alert
    flash[:alert] = 'Here is an alert...'
    render inline: ''
  end

end
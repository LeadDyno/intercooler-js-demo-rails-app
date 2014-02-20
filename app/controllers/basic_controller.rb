class BasicController < ApplicationController

  def index
    unless params['ic-request'].blank?
      response.headers['X-IC-PushState'] = '/basics'
      render layout: false
    end
  end

end
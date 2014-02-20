class BasicController < ApplicationController

  def index
    render layout: params['ic-request'].blank?
  end

end
class SlickNavController < ApplicationController

  def tab1
    if params['ic-request'].blank?
      render :view
    else
      response.header['X-IC-SetLocation'] = request.path
      render :partial => 'tab1_content'
    end
  end

  def tab2
    if params['ic-request'].blank?
      render :view
    else
      response.header['X-IC-SetLocation'] = request.path
      render :partial => 'tab2_content'
    end
  end

  def tab3
    if params['ic-request'].blank?
      render :view
    else
      response.header['X-IC-SetLocation'] = request.path
      render :partial => 'tab3_content'
    end
  end

end
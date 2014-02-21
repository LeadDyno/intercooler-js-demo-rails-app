class SlickNavController < ApplicationController

  def tab1
    unless params['ic-request'].blank?
      render :partial => 'tab1_content'
    end
  end

  def tab2
    unless params['ic-request'].blank?
      render :partial => 'tab2_content'
    end
  end

  def tab3
    unless params['ic-request'].blank?
      render :partial => 'tab3_content'
    end
  end

end
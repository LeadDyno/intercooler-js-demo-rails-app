module ApplicationHelper

  def active_if(hash)
    'active' if context_matches hash
  end

  def context_matches(hash)
    matches = true
    if hash[:action]
      matches = false if params[:action].to_sym != hash[:action].to_sym
    end
    if hash[:actions]
      matches = false if !hash[:actions].map(&:to_sym).member?(params[:action].to_sym)
    end
    if hash[:unless_action]
      matches = false unless params[:action].to_sym != hash[:unless_action].to_sym
    end
    if hash[:unless_actions]
      matches = false unless !hash[:actions].map(&:to_sym).member?(params[:action].to_sym)
    end
    if hash[:controller]
      matches = false if params[:controller].to_sym != hash[:controller].to_sym
    end
    if hash[:controllers]
      matches = false if !hash[:actions].map(&:to_sym).member?(params[:controllers].to_sym)
    end
    if hash[:unless_controller]
      matches = false unless params[:controller].to_sym != hash[:controller].to_sym
    end
    if hash[:unless_controllers]
      matches = false unless !hash[:actions].map(&:to_sym).member?(params[:controllers].to_sym)
    end
    matches
  end

end

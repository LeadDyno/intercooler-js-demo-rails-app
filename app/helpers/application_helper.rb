module ApplicationHelper

  def active_if(hash)
    'active' if context_matches hash
  end

  def context_matches(hash)
    if hash[:action]
      return false if params[:action].to_sym != hash[:action].to_sym
    end
    if hash[:actions]
      return false if hash[:actions].map(&:to_sym).member?(params[:action].to_sym)
    end
    if hash[:unless_action]
      return false unless params[:action].to_sym != hash[:unless_action].to_sym
    end
    if hash[:unless_actions]
      return false unless hash[:actions].map(&:to_sym).member?(params[:action].to_sym)
    end
    if hash[:controller]
      return false if params[:controller].to_sym != hash[:controller].to_sym
    end
    if hash[:controllers]
      return false if hash[:actions].map(&:to_sym).member?(params[:controllers].to_sym)
    end
    if hash[:unless_controller]
      return false unless params[:controller].to_sym != hash[:controller].to_sym
    end
    if hash[:unless_controllers]
      return false unless hash[:actions].map(&:to_sym).member?(params[:controllers].to_sym)
    end
    true
  end

end

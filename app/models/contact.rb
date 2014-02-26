class Contact < ActiveRecord::Base

  validates :email, :presence => true, :email => true

  def activate!
    self.status = 'Active'
    self.save!
  end

  def deactivate!
    self.status = 'Inactive'
    self.save!
  end

end

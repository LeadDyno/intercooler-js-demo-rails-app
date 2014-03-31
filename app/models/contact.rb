class Contact < ActiveRecord::Base

  validates :email, :presence => true, :email => true
  validate :email_is_ok

  def activate!
    self.status = 'Active'
    self.save!
  end

  def deactivate!
    self.status = 'Inactive'
    self.save!
  end

  def email_is_ok
    if email == 'duplicate@test.com'
      errors[:email] << 'Email already in use!'
    end
  end

end

class User < ActiveRecord::Base
  has_many :requests 
  has_many :members
  has_many :groups, through: :members
  has_secure_password
  
  validates :email,
  	format: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
  	uniqueness: true
  	
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :password_reset_token, :password_reset_sent_at, :usertype

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_request_list
    UserMailer.request_list(self).deliver
  end
    
  def full_name
    "#{self.first_name} #{self.last_name.first}."
  end
  
end

require 'digest/sha2'

class User < ActiveRecord::Base
  validates_length_of :email, :name, :password, :within => 3..45
  validates_length_of :password, :within => 4..64
  validates :email, :name, :password, :password_confirmation, :presence => true, :on => :authenticate
  validates :email, :name, :password, :password_confirmation, :presence => true
  validates_uniqueness_of :email
  validates_confirmation_of :password, :password_confirmation
  
  attr_protected :id, :hashed_pwd
  
  attr_accessor :password, :password_confirmation
  
  before_create do
    self.hashed_pwd = User.encrypt(self.password)
  end
  
  def self.authenticate(email, pass)
    return nil if email && pass == ''
    user = find_by_email(email)
    return nil if user.nil?
    return user if User.encrypt(pass) == user.hashed_pwd
  end

  protected

  def self.session_expired(expire_time)
    if expire_time < Time.now
      return true
    else
      return false
    end
  end
  
  def self.encrypt(pass)
    Digest::SHA512.hexdigest(pass)
  end
end

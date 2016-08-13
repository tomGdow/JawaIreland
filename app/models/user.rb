require "digest"

class User < ActiveRecord::Base
  attr_accessible :username, :email, :hashed_password, :password, :password_confirmation, :admin
  attr_accessor :password
  before_save :encrypt_password

  validates   :username,
              :uniqueness => true,
              :length => {:within => 7..25},
              :format => {:with => /^[a-zA-Z0-9][a-zA-Z0-9_]*$/, :message => "Only letters and numbers allowed" },
              :presence => true

  validates   :email,
              :uniqueness => true,
              :length => {:within => 5..25},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i},
              :presence => true

  validates   :password,
              :length => {:within => 7..25},
              :presence => true

  validates_confirmation_of   :password,
                              :length => {:within => 7..25},
                              :presence => true,
                              :message => "and password confirmation must match."

  validates   :password_confirmation,
              :length => {:within => 7..25},
              :presence => true

  validates_confirmation_of   :password_confirmation,
                              :length => {:within => 7..25},
                              :presence => true






  has_many :motorbikes

  #def self.authenticate(email, password)
  #    user= find_by_email(email)
  #     return user if user && user.authenticated?(password)
  #end

  def self.authenticate(username="",email="",password)

    unless  email.to_s.match("@")
      user = User.find_by_username(username)
    else
      user = User.find_by_email(email)
    end

    if user && user.authenticated?(password)
      return user
    else
      return false
    end
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password + "josef_thomas" + salt)
  end


  protected
  def encrypt_password
    return if password.blank?
    salt = generate_salt
    self.hashed_password = encrypt(password + "josef_thomas" + salt)
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

  def generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(10) { |i| salt << chars[rand(chars.size-1)] }
    self.salt = salt
  end

end

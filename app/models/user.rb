class User < ApplicationRecord
  before_create :setup_default_role_for_new_users

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  extend Enumerize
  enumerize :role, in: [:user, :moderator, :admin]

  #validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :articles
  has_many :comments
  has_many :marks
  has_many :responses
  
  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(auth, signed_in_resource = nil)

    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      #email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email #if email_is_verified
      user = User.where(:email => email).first if email

      if user.nil?        
        if auth.provider == "facebook"
          first_name, last_name = auth.info.name.split(" ")
        elsif auth.provider == "vkontakte"
          first_name = auth.extra.raw_info.first_name 
          last_name = auth.extra.raw_info.last_name
          dob = auth.extra.raw_info.bdate  
        end
        user = User.new(
          first_name: first_name,
          last_name: last_name,
          dob: dob,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        #user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def title
    self.email
  end

  private

    def setup_default_role_for_new_users
      if self.role.blank?
        self.role = "user"
      end
    end
end

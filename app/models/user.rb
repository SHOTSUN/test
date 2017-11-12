class User < ActiveRecord::Base 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter, :facebook, :vkontakte]

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0, 20]
  	end
  end


  def self.find_for_vkontakte_oauth access_token
    
      User.create!(:provider => access_token.provider,
      :email => access_token.extra.raw_info.domain+'@vk.com', 
      :password => Devise.friendly_token[0,20]) 
    
  end



end

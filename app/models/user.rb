# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  full_name              :string
#  role                   :integer          default("user")
#  auth_token             :string
#  stripe_customer_id     :string
#  source                 :string
#  provider               :string
#  uid                    :string
#  image                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_subscription_id :string
#  stripe_charge_id       :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  enum role: [:user, :owner, :admin]

  after_create :send_welcome_email
  before_create :generate_token

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
          full_name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0, 20],
          image: data['image']
      )
    end
    user
  end

  def generate_token
    begin
      self.auth_token = SecureRandom.hex.to_s
    end while self.class.exists?(auth_token: auth_token)
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end
end

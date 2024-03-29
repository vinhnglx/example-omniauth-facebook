# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  oauth_token            :string(255)
#  oauth_expires_at       :datetime

class User < ActiveRecord::Base

  # Take the data returned by Facebook
  # Try to find a corresponding user in our database
  # and then update or create the user necessary.
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider           = auth.provider
      user.uid                = auth.uid
      user.name               = auth.info.name
      user.oauth_token        = auth.credentials.token
      user.oauth_expires_at   = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end

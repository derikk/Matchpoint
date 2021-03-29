# Stores private information from Oauth, not editable by users
class User < ApplicationRecord
  has_one :profile

  validates_presence_of :email, :name, :uid
  validates_uniqueness_of :email, :uid

  def self.from_oauth(auth)
    User.find_or_create_by(uid: auth.uid) do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.uid = auth.uid
    end
  end
end

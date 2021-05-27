# Record for private information from OAuth; not user-editable
class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  after_create :build_default_profile

  validates_presence_of :email, :name, :uid
  validates_uniqueness_of :email, :uid

  def self.from_oauth(auth)
    User.find_or_create_by(uid: auth.uid) do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.uid = auth.uid
    end
  end

  private
    # Start each user off with an (incomplete) profile
    def build_default_profile
      self.build_profile(name: self.name).save(validate: false)
    end
end

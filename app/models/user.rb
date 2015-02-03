class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, email: auth.email, affiliation: auth.affiliation).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.extra.raw.email
      user.affiliation = auth.info.affiliation
    end
  end
end

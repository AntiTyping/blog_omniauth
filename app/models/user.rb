class User < ActiveRecord::Base
  def self.from_omniauth(omniauth)
    where(omniauth.slice("provider", "uid")).first || create_from_omniauth(omniauth)
  end

  def self.create_from_omniauth(omniauth)
    create! do |user|
      user.provider = omniauth["provider"]
      user.uid = omniauth["uid"]
      user.name = omniauth["info"]["name"]
    end
  end
end

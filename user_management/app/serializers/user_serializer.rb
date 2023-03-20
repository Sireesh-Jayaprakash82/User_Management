class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :username, :roles

  def roles
    object.roles.pluck(:role_name)
  end

  def password=(raw)
    @password = raw
    self.password_digest = BCrypt::Password.create(raw)      
  end

end

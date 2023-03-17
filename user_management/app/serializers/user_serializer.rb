class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :username, :role

    def role
        object.roles.collect(&:role_name)
    end
end
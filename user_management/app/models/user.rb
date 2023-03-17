class User < ApplicationRecord
    has_and_belongs_to_many :roles
    def self.active
        where(status: 'active')
    end
    def self.deactive
        where(status: 'deactive')
    end
    def active?
        status == 'active'
    end
    def deactive?
        status == 'deactive'
    end
end
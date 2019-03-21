class User < ActiveRecord::Base
    has_secure_password
    has_many :art_objects, dependent: :destroy
end

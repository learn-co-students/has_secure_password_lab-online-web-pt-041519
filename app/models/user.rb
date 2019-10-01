class User < ActiveRecord::Base
    has_secure_password
    
    def destroy_all
    end
end

class User < ActiveRecord::Base
  #attr_accessible :password, :confirmation
  #attr_accessor :password, :confirmation
  #validates :password, :presence =>true,
                    #:length => { :minimum => 5, :maximum => 40 },
                    #:confirmation =>true
  #validates_confirmation_of :password
end

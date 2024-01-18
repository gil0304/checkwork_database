require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection

class Member < ActiveRecord::Base
end

require 'bitchin'
require 'hashed'

ActiveRecord::Base.send(:extend, Bitchin)
ActiveRecord::Base.send(:extend, Hashed)

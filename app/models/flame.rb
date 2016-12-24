class Flame < ActiveRecord::Base
  serialize :colors, Array
  has_many :tacos
end

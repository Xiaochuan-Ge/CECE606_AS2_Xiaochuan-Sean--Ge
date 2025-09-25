class Movie < ActiveRecord::Base
    scope :sorted_by, ->(sort_by, direction) {
    order("#{sort_by} #{direction}")
  }
end
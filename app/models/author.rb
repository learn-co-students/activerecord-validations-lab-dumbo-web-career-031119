class Author < ActiveRecord::Base

  validates_presence_of :name
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10 }

end

class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10, maximum: 10 }

end

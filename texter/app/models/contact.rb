class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10, maximum: 10 }

  def self.from_number(phone_number)

    phone_number.slice!("+1")
    result = Contact.where(phone_number: phone_number)
    if result.length == 0
      return phone_number
    else
      return result.first.name
    end

  end

end

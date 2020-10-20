class Property < ApplicationRecord
   has_many :stations
   validates :property, presence: true
   validates :rent, presence: true
   validates :address, presence: true
   validates :age, presence: true
   #validates :remarks, presence: true
   accepts_nested_attributes_for :stations, allow_destroy: true,reject_if: :all_blank

   def check
    if minutes_on_foot.present? && minutes_on_foot1.present?
      if minutes_on_foot <= minutes_on_foot1
        errors.add(:minutes_on_foot, 'Station one is further than station two')
      end
    end
  end
end

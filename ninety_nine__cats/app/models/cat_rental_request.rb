# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'byebug'
class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: { in: ['PENDING','APPROVED','DENIED'],
        message: "status must be pending, approved, or denied" }

    validates :cat_id, :start_date, :end_date, presence: true

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def overlapping_requests
        CatRentalRequest
            .where(cat_id: self.cat_id)
            .where("? != id", self.id)
            .where("(? BETWEEN start_date AND end_date) 
                OR (start_date BETWEEN ? AND ?)", 
                self.start_date, self.start_date, self.end_date)
    end    


end

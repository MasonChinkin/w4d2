# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  birth_date  :date             not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'byebug'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :sex, inclusion: { in: ['M','F'],
        message: "sex must be M or F" }

    validates :name, :birth_date, :color, :sex, :description, presence: true
    

    def age
        bd = birth_date
        # byebug
        time_ago_in_words(bd.to_time)
    end
end

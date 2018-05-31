class Document < ApplicationRecord
  belongs_to :personnel
  validates :name,:startdate,:enddate, presence: true


end

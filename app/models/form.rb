class Form < ApplicationRecord

  has_many :completed_forms
  belongs_to :tenant

end

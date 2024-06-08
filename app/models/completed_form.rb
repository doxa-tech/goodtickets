class CompletedForm < ApplicationRecord

  belongs_to :form
  belongs_to :tenant

end

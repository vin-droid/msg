class DataSheet < ApplicationRecord
  belongs_to :uploaded_by, class_name: 'admin'

  has_one_attached :excel_file

end

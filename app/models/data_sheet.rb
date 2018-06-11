class DataSheet < ApplicationRecord
  belongs_to :admin
  has_one_attached :excel_file
  after_save :process_file


  protected
  def process_file
  	worksheet = XlsxReader.open(LocalFileUploader.new(excel_file.blob).save_file)
		header,content = worksheet.read_xlsx.content_in('array')
		ApplicationRecord.transaction do
			User.import USER_FIELD, content, on_duplicate_key_ignore: true, validate: 	true
		end
	end
end



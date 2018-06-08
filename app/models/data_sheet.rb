require 'simple_xlsx_reader'
class DataSheet < ApplicationRecord
  # belongs_to :uploaded_by, class_name: 'admin'
  belongs_to :admin

  has_one_attached :excel_file
  after_save :read_excel_file

  # rails_admin do
  #   field :excel_file, :active_storage
  # end
  def create_user(worksheet)
  	professions = Profession.pluck(:field_name,:id).to_h
  	professions_area = ProfessionArea.pluck(:name,:id).to_h
  	professions_level = ProfessionLevel.pluck(:name,:id).to_h
    binding.pry
		# header,content = worksheet.content_in('array')
  # 	content.tap do |c|
  			# c[]
  # 	end
  	# # user_import = {c["name"],c["email"],c["dob"],c["mobile"],"Current Salary", ["Gender"],"Current Location","Address"}
  	# # end
  	# columns = header
  	# values = []
  	# User.import 
  end

  def self.save_user
  	ApplicationRecord.transaction do
			User.import USER_FIELD, content, on_duplicate_key_ignore: true
		end
  end

  protected
  def read_excel_file
  	# binding.pry

  	worksheet = {}
  	file_path = LocalFileUploader.new(excel_file.blob).save_file
  	worksheet = XlsxReader.open(file_path)
  	worksheet.read_xlsx
  	########### Save user basic details
		header,content = worksheet.content_in('array')
		# User.delay.save_user(content)
		ApplicationRecord.transaction do
			# MOdify Hash and Save User
			# content.in_groups_of(1000).each do |group_data|

			User.import USER_FIELD, content, on_duplicate_key_ignore: true, validate: false
		# end
		end

  	########### Pending
  	return
  	# save user, profession, profession_level, profession_area
  	
  	# header,content = worksheet.content_in('hash', ["Functional Area","Area of Specialization","Course(Highest Education)"])
  	# binding.pry
  	# ApplicationRecord.transaction do 
  	# Profession.import ["field_name"], content["Functional Area"], on_duplicate_key_ignore: true  
  	# ProfessionArea.import ["name"], content["Area of Specialization"], on_duplicate_key_ignore: true  
  	# ProfessionLevel.import ["name"], content["Course(Highest Education)"], on_duplicate_key_ignore: true 
  	# end 
  	


  	# professions = Profession.pluck(:field_name,:id).to_h
  	# professions_area = ProfessionArea.pluck(:name,:id).to_h
  	# professions_level = ProfessionLevel.pluck(:name,:id).to_h
    # binding.pry
		# header,content = worksheet.content_in('array')
  # 	content.tap do |c|
  		
  # 	end
  	# # user_import = {c["name"],c["email"],c["dob"],c["mobile"],"Current Salary", ["Gender"],"Current Location","Address"}
  	# # end
  	# columns = header
  	# values = []
  	# User.import 



  	# header = rows.first
  	# profession_level_pos = header.index("Level")
  	# profession_pos = header.index("Functional Area")
  	# profession_area_pos = header.index("Area of Specialization")

		# end
  end



end



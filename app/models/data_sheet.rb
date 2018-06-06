require 'simple_xlsx_reader'
class DataSheet < ApplicationRecord
  # belongs_to :uploaded_by, class_name: 'admin'
  belongs_to :admin

  has_one_attached :excel_file
  after_save :create_user

  # rails_admin do
  #   field :excel_file, :active_storage
  # end

  protected
  def create_user
  	binding.pry
  	worksheet = {}
  	excel_file.open do |file|
  		worksheet = XlsxReader.open(file.path)
  		file.close
  	end
  	worksheet.read_xlsx

  	# save user, profession, profession_level, profession_area
  	
  	header,content = worksheet.content_in('hash', ["Functional Area","Area of Specialization","Course(Highest Education)"])
  	
  	Profession.import content["Functional Area"], on_duplicate_key_ignore: true  
  	ProfessionArea.import content["Area of Specialization"], on_duplicate_key_ignore: true  
  	ProfessionLevel.import content["Course(Highest Education)"], on_duplicate_key_ignore: true  
  	


  	professions = Profession.pluck(:name,:id).to_h
  	professions_area = ProfessionArea.pluck(:name,:id).to_h
  	professions_level = ProfessionLevel.pluck(:name,:id).to_h
    binding.pry
		header,content = worksheet.content_in('array')
  	content.tap do |c|
  		
  	end
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



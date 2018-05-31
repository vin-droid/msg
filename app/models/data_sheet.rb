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

  	excel_file.open do |file|
  		worksheets = SimpleXlsxReader.open file.path
  		file.close
  	end


  	# save user, profession, profession_level, profession_area
  	# 
  	worksheets.first.rows.each do |row|
  		profession  = row[]
  	end

  	header = rows.first
  	profession_level_pos = header.index("Level")
  	profession_pos = header.index("Functional Area")
  	profession_area_pos = header.index("Area of Specialization")

		workbook = SimpleXlsxReader.open './sample_excel_files/xlsx_500000_rows.xlsx'
		worksheets = workbook.sheets
		puts "Found #{worksheets.count} worksheets"

		worksheets.each do |worksheet|
		  puts "Reading: #{worksheet.name}"
		  num_rows = 0
		  worksheet.rows.each do |row|
		    row_cells = row
		    num_rows += 1
		  end
		  puts "Read #{num_rows} rows"
		end
  end
  
end

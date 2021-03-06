module CommonHelper
	extend ActiveSupport::Concern


	class XlsxReader
		attr_accessor :workbook
		def self.open(filepath)
			workbook = SimpleXlsxReader.open(filepath)
		end
	end

	class ::SimpleXlsxReader::Document
		attr_accessor :content, :header
		def read_xlsx()
			@header = sheets.first.rows.shift.map(&:to_key)
			missing_columns = REQUIRED_USER_FIELD - header
			raise "#{missing_columns.join(', ')} are missing." if missing_columns.present?
			@content = sheets.first.rows
			self
		end

		def content_in(format = nil, columns = [])
			new_header = columns.present? ? (self.header & columns.to_a) : self.header
			raise "#{missing_columns.join(', ')} are not valid columns" if (missing_columns = columns - header).present?
			raise "No Profession found. Please create profession" unless (professions = Profession.pluck(:field_name, :id).to_h).present?
			case format
			when 'hash'
				content_in_hash = {}
				self.content.each_with_index do |row, index1|
					next unless row.present?
					header.each_with_index do |key, index2|
						next unless row[index2].present?
						content_in_hash[key] = [] unless content_in_hash[key].present?
						content_in_hash[key].push([row[index2]])
					end
				end
				content = content_in_hash
			when 'array'
				content_in_array = []
				self.content.each do |row|
					new_row = {}
					new_header.each_with_index do |key, index|
						key = key.to_key
						next unless USER_FIELD.include?(key)
						if key.eql?("highest_education")
							new_row[key] = HIGHEST_EDUCATION[row[index]]
						elsif key.eql?("gender")
							new_row[key] = GENDER[row[index].to_sym]
						elsif key.eql?("mobile")
							new_row[key] = row[index].to_s.split('.')[0]
						else
							new_row[key] = row[index].to_s
						end
						new_row["city_id"] = 1
						new_row["state_id"] = 2
						new_row["profession_id"] = professions[row[index]] || 2
					end
					content_in_array.push(new_row)
				end
				content = content_in_array
			else
			end
			[new_header, content]
		end
	end


	class LocalFileUploader
 		include ActiveStorage::Downloading
 		attr_reader :blob
 		attr_accessor :filepath

	    def initialize(blob)
	      @blob = blob
	      @filepath = "#{Rails.root}/#{blob.filename}"
	    end

	    def save_file
	      download_blob_to_tempfile do |file|
	        FileUtils.mv(file.path, @filepath)
	      end
	      @filepath
	    end
	end

	class ::String
		def to_key
			to_s.downcase.parameterize.underscore
		end
	end

	class ::Float
		def to_mob_number
			to_i.to_s
		end
	end
end
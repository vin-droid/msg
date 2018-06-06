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
			self.header = sheets.first.rows.shift
			self.content = sheets.first.rows
			self
		end

		def content_in(format = nil, columns = [])
			# new_header = columns.present? ? (self.header & columns.to_a) : self.header
			# new_header.map { |header| columns.include?(header)}
			case format
			when 'hash'
				content_in_hash = {}
				new_header.each_with_index do |key, index|
					content_in_hash[key] = self.content.map do |row|
						row[index]
					end
				end
				content = content_in_hash
			when 'array'
				content_in_array = []
				self.content.each do |row|
					new_row = []
					new_header.each_with_index do |key, index|
						new_row.push({"#{key}": row[index] })
					end
					content_in_array.push(new_row)
				end
				content = content_in_array
			else
			end
			[new_header, content]
		end
	end
end
class User < ApplicationRecord
  # belongs_to :city
  # belongs_to :state
  # belongs_to :profession
  validates :name, uniqueness: { scope: [:email, :dob],
    message: "should be uniq." }
  validates :name, :email, :mobile, :gender, presence: true
enum gender: [:male, :female]
enum highest_education: HIGHEST_EDUCATION.keys

end

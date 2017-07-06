# キューポイントクラス
class Cuepoint < ApplicationRecord
  has_and_belongs_to_many :campaigns
  has_many :results, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: true
end

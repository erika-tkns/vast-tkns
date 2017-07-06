# キャンペーンクラス
class Campaign < ApplicationRecord
  has_and_belongs_to_many :cuepoints
  has_many :results, dependent: :destroy
  
  
  validates :name, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: true
  validates :limit_start, numericality:{ only_integer: true, greater_than: 0, less_than: 10000 }
  validates :movie_url, length: { minimum: 5, maximum: 100 }
  validates_datetime :start_at
  validates_datetime :end_at, on_or_after: :start_at

  # validate :start_end_check

  # def start_end_check
  #   errors.add(:end_date, "の日付を正しく記入してください。") unless
  #   self.start_date < self.end_date
  # end
  # 有効なキャンペーン一覧を返す
  #  - 対象のCue Pointと紐付いている。
  #  - キャンペーンが開始していて、終了する前。
  #  - Resultのスタート数(count_start)がキャンペーンの制限(limit_start)以内。
  # @param [Cuepoint, #read] cuepoint キャンペーンの対象となっている Cue Point
  # @return [Array] 該当キャンペーンの配列
  def self.current_avaliable(cuepoint)
    @now_campaigns = cuepoint.campaigns.where("start_at <= '#{Time.now}' AND end_at >= '#{Time.now}'")
    @now_campaigns.each do |campaign|
      result = Result.where(campaign: campaign, cuepoint: cuepoint).first
        if !result.blank? && campaign.limit_start < result.count_start 
          return campaigns
        end
      end
  end
end

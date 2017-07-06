# 結果クラス
class Result < ApplicationRecord
  validates :campaign_id, presence: true
  validates :cuepoint_id, presence: true
  validates :count_start, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
  validates :count_complete, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
  # initialize_after/ before_save
  belongs_to :campaign  # SELECT campaigns.* from campaigns where id = self.campaign_id
  belongs_to :cuepoint  # SELECT cuepoints.* from cuepoints where id = self.cuepoint_id
  
  private
    # 初期化
    def zero_clear
      # TODO
    end
end
# 結果クラス
class Result < ApplicationRecord
  # initialize_after/ before_save
  belongs_to :campaign  # SELECT campaigns.* from campaigns where id = self.campaign_id
  belongs_to :cuepoint  # SELECT cuepoints.* from cuepoints where id = self.cuepoint_id
  
  private
    # 初期化
    def zero_clear
      # TODO
    end
end
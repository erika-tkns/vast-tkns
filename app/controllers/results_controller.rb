# レポート関連コントローラ
class ResultsController < ApplicationController
  # 結果一覧表示
  def index
    @results = Result.all.order(:campaign_id, :cuepoint_id)
  end

  # 結果追加
  def record
    after_initialize do |result|
    @result = Result.find_or_initialize_by(id: params[:result_id])
    if @result.count_start == null
      @result.count_start = 0
      @result.count_complete = 0
    end
    @result.count_start += 1
    @result.count_complete += 1
    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
    end
  end
end
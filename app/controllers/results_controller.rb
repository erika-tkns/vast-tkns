# レポート関連コントローラ
class ResultsController < ApplicationController
  # 結果一覧表示
  def index
    @results = Result.all.order(:campaign_id, :cuepoint_id)
  end

  # 結果追加
  def record
    @result = Result.find_or_initialize_by(campaign_id: params[:campaign], cuepoint_id: params[:cuepoint])
    if @result.count_start == nil
      @result.count_start = 0
      @result.count_complete = 0
    end
    
    if params[:event] == 'start'
    @result.count_start += 1
    end
    if params[:event] == 'complete'
    @result.count_complete += 1
    end
    @result.save!
    # 最後には、キチンと @result を保存する 理由:count_completeなどの値を変更させているから
    # 強制的な保存(validationのスキップ)は、 `save!` メソッドも使える
    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
  end
end
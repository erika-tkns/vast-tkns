# Cue Point コントローラ
class CuepointsController < ApplicationController
  # 一覧
  def index
    @cuepoints = Cuepoint.all
  end

  # 新規
  def new
   @cuepoint = Cuepoint.new
  end

  # 作成
  def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    
    if @cuepoint.save
      flash[:success] = 'Cuepointが正常に保存されました。'
      redirect_to cuepoints_path
    else
      flash.now[:danger] = 'Cuepointが保存できませんでした。'
      render :new
    end
  end

  # 編集
  def edit
    @cuepoint = Cuepoint.find(params[:id])
  end

  # 更新
  def update
    @cuepoint = Cuepoint.find(params[:id])
    
    if @cuepoint.update(cuepoint_params)
      flash[:success] = 'キューポイントは正常に更新されました。'
      redirect_to cuepoints_path
    else
      flash.now[:danger] = 'キューポイントは更新されませんでした。'
      render :edit
    end
  end

  # 削除
  def destroy
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy
    
    flash[:success] = 'キューポイントは正常に削除されました'
    redirect_to cuepoints_url
  end

  private
    # キューポイント用パラメータ
    def cuepoint_params
      params.require(:cuepoint).permit(:name)
    end
end

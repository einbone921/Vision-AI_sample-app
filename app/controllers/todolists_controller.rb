class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    # APIに引数で投稿の本文を渡し、戻り値を元にスコアを作成
    list.score = Language.get_data(list_params[:body])
    list.save
    # APIに引数で投稿画像のデータを渡し、戻り値を元にタグを作成
    tags = Vision.get_image_data(list.image)
    tags.each do |tag|
      list.tags.create(name: tag)
    end
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end

class ArticlesController < ApplicationController
  def index
	@article = Article.status_active
  end

  def new
	@article = Article.new
  end

  def create
	@article = Article.new(params_article)
	if @article.save
		flash[:notice] = "Success Add New Article"
		redirect_to action: 'index'
	else
		flash[:error] = "Data Not Valid"
	        render 'new'
	end
  end

  def show
	@article = Article.find_by_id(params[:id])
  end

  def edit
	@article = Article.find_by_id(params[:id])	
  end

  def update
	@article = Article.find_by_id(params[:id])
	if @article.update(params_article)
		flash[:notice] = "Success Update Records"
		redirect_to action: 'index'
	else
		flash[:error] = "Data Not Valid"
		render 'edit'
	end
  end

  def destroy
	@article = Article.find_by_id(params[:id])
	if @article.destroy
		flash[:notice] = "Success Delete Articles"
		redirect_to action: 'index'
	else
		flash[:error] = "Failed Delete Articles"
		redirect_to action: 'index'
	end
  end

private
  def params_article
	params.require(:article).permit(:title, :content, :status)
  end

end

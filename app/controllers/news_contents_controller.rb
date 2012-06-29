class NewsContentsController < ApplicationController
  layout 'news'

  require 'rubygems'
  require 'htmlentities'

  before_filter :load_page
  before_filter :get_news_info, :execpt => [:destroy]
  before_filter :get_content_info, :only => [:edit, :destroy,:update]

  def index
    @contents = @news.contents.where('status != "deleted"')
  end

  def edit
  end

  def destroy
    @content.status='DELETED'
    @content.save
    redirect_to(news_contents_path(@news, :page => @page))
  end
  
  def update
    coder = HTMLEntities.new
    respond_to do |format|
      if @content.update_attributes(params[:news_content])
         flash[:notice] = 'content was successfully updated.'
         format.html { redirect_to news_contents_path(@news, :page => @page)}
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def new
    @content = NewsContent.new
  end

  def create
    @translation = NewsContent.new(params[:news_content])
    @translation.news = @news
    respond_to do |format|
      if @translation.save
        flash[:notice] = 'content was successfully created.'
        format.html { redirect_to news_contents_path(@translation.news, :page => @page) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  private
  def load_page
    @page=params[:page] || 1
  end

  def get_news_info
    begin
      @news = News.find(params[:news_id])
    rescue ActiveRecord::RecordNotFound
       msg = "Attention: news with ID:#{params[:news_id]} not found in database"
       logger.error(msg)
       flash[:notice] = msg
       redirect_to news_index_path
     end
  end
  def get_content_info
    begin
      content_id=params[:id]
      @content = NewsContent.find(content_id)
    rescue ActiveRecord::RecordNotFound
       msg = "Attention: content with ID:#{content_id} not found in database"
       logger.error(msg)
       flash[:notice] = msg
       redirect_to news_index_path
     end
  end
end

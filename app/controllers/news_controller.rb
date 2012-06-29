class NewsController < ApplicationController
  layout 'news'
  before_filter :load_news, :only => ['edit', 'destroy', 'update','show']
  before_filter :load_page
  before_filter :load_categories, :only => ['new', 'edit']
    
    #layout 'mails' 

    def index
      @news = News.where("status != 'DELETED'").order("id DESC").paginate(:page => @page, :per_page => 10)
      #@languages = Language.all
    end

    def destroy
      @news.status='DELETED'
      @news.save
      redirect_to(:action=> "index",:page=>@page)
    end

    def edit
     @path=news_path(@news,:page=>@page)
     
    end

    def show
      #@languages = Language.all
    end

    def update
       respond_to do |format|
         if @news.update_attributes(params[:news])
           flash[:notice] = 'newsletters was successfully updated.'
           format.html { redirect_to(:action =>"index",:page=>@page) }
         else
           @path=news_path(@news,:page=>@page)
           format.html { render :action => "edit" }
         end
       end
     end

     def new
       @news = News.new
       @path = news_index_path
       
       respond_to do |format|
         format.html # new.html.erb
       end
     end

     def create
       @news = News.new(params[:news])

       respond_to do |format|
         if @news.save
           flash[:notice] = 'newsletters was successfully created.'
           format.html { redirect_to(:action =>"index") }
         else
           @path=news_index_path(:page=>@page)
           format.html { render :action => "new" }
         end
       end
     end 
     def load_categories
       @categories = NewsCategory.all
     end
     def load_news
       begin
         id = params[:id]
         @news = News.find(id)
       rescue ActiveRecord::RecordNotFound
         msg = "Attention: news with ID:#{id} not found in database"
         logger.error(msg)
         flash[:notice] = msg
         redirect_to news_index_path
       end
     end

     def load_page
       @page=params[:page] || 1
     end
  end

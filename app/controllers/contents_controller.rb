class ContentsController < ApplicationController
  
  before_filter :load_page
  before_filter :get_chronicle_info, :execpt => [:destroy]
  before_filter :get_content_info, :only => [:edit, :destroy,:update]
  def index
    @contents = @chronicle.contents
  end

  def edit
  end

  def destroy
    @content.destroy
    redirect_to(chronicle_contents_path(@chronicle, :page => @page))
  end
  
  def update
     respond_to do |format|
       if @content.update_attributes(params[:chronicle_content])
         flash[:notice] = 'content was successfully updated.'
         format.html { redirect_to chronicle_contents_path(@chronicle, :page => @page)}
         
       else
         format.html { render :action => "edit" }
       end
     end
   end
  def new
    @content = ChronicleContent.new
  end

  def create
    @translation = ChronicleContent.new(params[:chronicle_content])
    @translation.chronicle = @chronicle
    respond_to do |format|
      if @translation.save
        flash[:notice] = 'content was successfully created.'
        format.html { redirect_to chronicle_contents_path(@translation.chronicle, :page => @page) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  private
  def load_page
    @page=params[:page] || 1
    
  end
  def get_chronicle_info
    begin
      @chronicle = Chronicle.find(params[:chronicle_id])
    rescue ActiveRecord::RecordNotFound
       msg = "Attention: Chronicle with ID:#{params[:chronicle_id]} not found in database"
       logger.error(msg)
       flash[:notice] = msg
       redirect_to chronicles_path
     end
  end
  def get_content_info
    begin
      content_id=params[:id]
      @content = ChronicleContent.find(content_id)
    rescue ActiveRecord::RecordNotFound
       msg = "Attention: content with ID:#{content_id} not found in database"
       logger.error(msg)
       flash[:notice] = msg
       redirect_to chronicles_path
     end
  end
end

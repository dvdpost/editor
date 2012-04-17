class ChroniclesController < ApplicationController
    before_filter :load_chronicle, :only => ['edit', 'destroy', 'update','show']
    before_filter :load_page
    before_filter :load_categories, :only => ['new', 'edit']
    
    #layout 'mails' 

    def index
      @chronicles = Chronicle.where("status != 'DELETED'").order("id DESC").paginate(:page => @page, :per_page => 10)
      #@languages = Language.all
    end

    def destroy
      @chronicle.status='DELETED'
      @chronicle.save
      redirect_to(:action=> "index",:page=>@page)
    end

    def edit
     @path=chronicle_path(@chronicle,:page=>@page)
     
    end

    def show
      #@languages = Language.all
    end

    def update
       respond_to do |format|
         if @chronicle.update_attributes(params[:chronicle])
           flash[:notice] = 'chronicle was successfully updated.'
           format.html { redirect_to(:action =>"index",:page=>@page) }
         else
           @path=chronicle_path(@chronicle,:page=>@page)
           format.html { render :action => "edit" }
         end
       end
     end

     def new
       @chronicle = Chronicle.new
       @path = chronicles_path()
       
       respond_to do |format|
         format.html # new.html.erb
       end
     end

     def create
       @chronicle = Chronicle.new(params[:chronicle])

       respond_to do |format|
         if @chronicle.save
           flash[:notice] = 'chronicle was successfully created.'
           format.html { redirect_to(:action =>"index") }
         else
           @path=chronicles_path(:page=>@page)
           format.html { render :action => "new" }
         end
       end
     end 
     def load_categories
       @categories = ChronicleCategory.all
     end
     def load_chronicle
       begin
         id = params[:id]
         @chronicle = Chronicle.find(id)
       rescue ActiveRecord::RecordNotFound
         msg = "Attention: chronicles with ID:#{id} not found in database"
         logger.error(msg)
         flash[:notice] = msg
         redirect_to chronicles_path
       end
     end
     def load_page
       @page=params[:page] || 1
     end
  end

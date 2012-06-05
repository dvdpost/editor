class ContentsController < ApplicationController

  require 'rubygems'
  require 'htmlentities'

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
    coder = HTMLEntities.new
    respond_to do |format|
      change_article(params)
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
    change_article(params)
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

  def change_article(params)
    case params[:lang]
      when 'fr'
        lang_id = 1
      when 'nl'
        lang_id = 2
      when 'en'
        lang_id = 3
    end
    coder = HTMLEntities.new
    if ( params[:chronicle_content][:full_description] =~ /@@/ || params[:chronicle_content][:description] =~ /@@/)
      ProductDescription.where("language_id = #{lang_id} and products_name != '' ").each do |p|
        n = p.title.gsub(")",'\)').gsub("(",'\(')
        name = coder.encode(n, :named)
        name = name.sub("&apos;","&#39;")
        
        reg = Regexp.new("@@#{name}@@",'i')
        if params[:chronicle_content][:full_description].scan(reg).size > 0
          url = p.product && p.product.imdb_id > 0 ? "/#{params[:lang]}/products?imdb_id=#{p.product.imdb_id}" : "/#{params[:lang]}/products/#{p.to_param}"
          params[:chronicle_content][:full_description] = params[:chronicle_content][:full_description].gsub(Regexp.new("@@#{name}@@",'i'),'<a href="'+url+'">'+p.title+'</a>')
        end
        if params[:chronicle_content][:description].scan(reg).size > 0
          url = p.product && p.product.imdb_id > 0 ? "/#{params[:lang]}/products?imdb_id=#{p.product.imdb_id}" : "/#{params[:lang]}/products/#{p.to_param}"
          params[:chronicle_content][:description] = params[:chronicle_content][:description].gsub(Regexp.new("@@#{name}@@",'i'),'<a href="'+url+'">'+p.title+'</a>')
        end
      end
    end
    if params[:lang] == 'nl'
      params[:chronicle_content][:full_description] = params[:chronicle_content][:full_description].gsub('"/fr/','"/nl/')
      params[:chronicle_content][:description] = params[:chronicle_content][:description].gsub('"/fr/','"/nl/')
    elsif params[:lang] == 'en'
      params[:chronicle_content][:full_description] = params[:chronicle_content][:full_description].gsub('"/fr/','"/en/')
      params[:chronicle_content][:description] = params[:chronicle_content][:description].gsub('"/fr/','"/en/')
    end
    Actor.where("actors_type = 'dvd_norm' and actors_name like '% %'").each do |a|
      name = a.name
      if params[:chronicle_content][:full_description].scan(Regexp.new("#{name}",'i')).size > 0
        if params[:chronicle_content][:full_description].scan(Regexp.new("#{name}\ *<\/a>",'i')).empty?
          name = coder.encode(a.name, :named)
          params[:chronicle_content][:full_description] = params[:chronicle_content][:full_description].gsub(Regexp.new("#{name}",'i'),'<a href="/'+params[:lang]+'/actors/'+a.cached_slug+'/products">'+name+'</a>')
        end
      end
      if params[:chronicle_content][:description].scan(Regexp.new("#{name}",'i')).size > 0
        if params[:chronicle_content][:description].scan(Regexp.new("#{name}\ *<\/a>",'i')).empty?
          name = coder.encode(a.name, :named)
          params[:chronicle_content][:description] = params[:chronicle_content][:description].gsub(Regexp.new("#{name}",'i'),'<a href="/'+params[:lang]+'/actors/'+a.cached_slug+'/products">'+name+'</a>')
        end
      end
      
    end
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

module NewsHelper
  def new_contents_link(news)
    content = ""
    [1,2,3].each do |lang|
      existing_translation = news.contents.where("language_id = ? and status != ?", lang, 'deleted').first
      content += translation_language_link(existing_translation,news,lang)
      content += ' '
    end 
    content.html_safe
  end

  def translation_language_link(existing_translation, news, lang)
    name = language_name(lang)
    if existing_translation
      link_to(name, edit_news_content_path(:news_id => news, :id => existing_translation.to_param, :page=>@page), :class=>"edit")
    else
      link_to(name, new_news_content_path(:news_id => news, :language_id => lang, :page=>@page), :class=>"new")
    end
  end
  
  def language_name(lang)
    case lang.to_i
    when 1
      name = 'fr'
    when 2
      name ='nl'
    when 3
      name ='en'
    end
  end
end
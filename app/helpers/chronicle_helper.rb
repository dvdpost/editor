module ChronicleHelper
  def new_contents_link(chronicle)
    content = ""
    [1,2,3].each do |lang|
      existing_translation = chronicle.contents.where("language_id = ?", lang).first
      content += translation_language_link(existing_translation,chronicle,lang)
      content += ' '
    end 
    content.html_safe
  end

  def translation_language_link(existing_translation, chronicle, lang)
    name = language_name(lang)
    if existing_translation
      link_to(name, edit_chronicle_content_path(:chronicle_id => chronicle, :id => existing_translation.to_param, :page=>@page), :class=>"edit")
    else
      link_to(name, new_chronicle_content_path(:chronicle_id => chronicle, :language_id => lang, :page=>@page), :class=>"new")
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
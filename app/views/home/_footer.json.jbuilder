json.id footer.id
json.img footer.img

if session[:locale] == "en" 
	json.name footer.title_en
elsif session[:locale] == "zh-TW" 
	json.name footer.title
end

if session[:locale] == "en" 
	json.content footer.content_en
elsif session[:locale] == "zh-TW" 
	json.content footer.content
end

json.url footer_url(footer, format: :json)
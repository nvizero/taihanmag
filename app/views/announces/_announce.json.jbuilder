json.id announce.id
json.img announce.img

if session[:locale] == "en" 
	json.name announce.title_en
elsif session[:locale] == "zh-TW" 
	json.name announce.title
end

# json.url announce_url(announce, format: :json)

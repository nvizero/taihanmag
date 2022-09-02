json.id cate.id
json.img cate.img.url

if session[:locale] == "en" 
	json.name cate.name_en
elsif session[:locale] == "zh-TW" 
	json.name cate.name
end

json.url cate_url(cate.id, format: :json)
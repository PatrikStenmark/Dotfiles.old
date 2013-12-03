function es-start --description 'start elastic search'
	elasticsearch -f -D es.config=/opt/boxen/homebrew/opt/elasticsearch/config/elasticsearch.yml; 
end

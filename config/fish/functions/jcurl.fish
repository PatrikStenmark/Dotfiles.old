function jcurl --description 'curl url and pipe through jq'
	curl $argv[1] | jq $argv[2..-1]
end

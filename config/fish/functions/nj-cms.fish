function nj-cms --description 'Start a WAP CMS in NJ env'
	set -xg FRONTEND_URL hamster
	set -xg MEMCACHE_SERVERS localhost:11211
	set -xg LOG_LEVEL 10
	set -xg RAILS_ENV nj
	rs -p 7500 -P tmp/pids/nj-server.pid

	set -e FRONTEND_URL
	set -e MEMCACHE_SERVERS
	set -e LOG_LEVEL
	set -e RAILS_ENV

end

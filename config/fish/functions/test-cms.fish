function test-cms --description 'Start a WAP CMS in cucumber env'
	set -xg FRONTEND_URL hamster
     set -xg MEMCACHE_SERVERS localhost:11211
     set -xg LOG_LEVEL 10
     set -xg RAILS_ENV cucumber
     rs -p 7000 -P tmp/pids/test-server.pid

     set -e FRONTEND_URL
     set -e MEMCACHE_SERVERS
     set -e LOG_LEVEL
     set -e RAILS_ENV
 
end

function fe-integration-tests
	set -xl CMS_API_URL http://localhost:7000/api/v1/
	if not count $argv > /dev/null
        set files spec/integration/*_spec.rb
    else
        set files $argv
    end

    rspec $files
end

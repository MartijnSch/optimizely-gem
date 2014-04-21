module Optimizely
	class Engine

		BASE_URL = "https://www.optimizelyapis.com/experiment/v1/"

		# Initialize Optimizely using an API token.
		#
		# == Options:
		# +:api_token+:: Use an API token you received before.
		# +:timeout+::   Set Net:HTTP timeout in seconds (default is 300).
		#
		def initialize(options={})
			@options = options
	  	check_init_auth_requirements
		end

		# Initalize the Token so it can be used in every request we'll do later on.
		# Besides that also set the authentication header.
	  def token=(token)
      @token = token
      set_headers
    end

    # Returns the list of projects available to the authenticated user.
    #
    # == Usage
    #  optimizely = Optimizely.new({ api_token: 'oauth2_token' })
    #  projects = optimizely.projects # Look up all projects.
    #
		def projects
			@projects = self.get("projects") if @projects.nil?
			@projects
		end

    # Returns the list of experiments for a specified project.
    #
    # == Usage
    #  optimizely = Optimizely.new({ api_token: 'oauth2_token' })
    #  experiments = optimizely.experiments(12345) # Look up all experiments for a project.
    #
		def experiments(project_id)
			raise OptimizelyError::NoProjectID, "A Project ID required to retrieve experiments." if project_id.nil?
			@experiments = self.get("projects/#{project_id}/experiments") if @experiments.nil?
			@experiments
		end

    # Returns the list of variations for a specified experiment.
    #
    # == Usage
    #  optimizely = Optimizely.new({ api_token: 'oauth2_token' })
    #  variations = optimizely.variations(12345) # Look up all variations for an experiment.
    #
		def variations(experiment_id)
			raise OptimizelyError::NoExperimentID, "An Experiment ID required to retrieve variations." if experiment_id.nil?
			@variations = self.get("projects/#{experiment_id}/variations") if @variations.nil?
			@experiments
		end

    # Returns the list of audiences for a specified project.
    #
    # == Usage
    #  optimizely = Optimizely.new({ api_token: 'oauth2_token' })
    #  audiences = optimizely.audiences(12345) # Look up all audiences for a project.
    #
		def audiences(project_id)
			raise OptimizelyError::NoProjectID, "A Project ID required to retrieve audiences." if project_id.nil?
			@audiences = self.get("projects/#{project_id}/audiences") if @audiences.nil?
			@audiences
		end

	  def get(url)
	  	uri 		 = URI.parse("#{BASE_URL}#{url}/")
	  	https    = Net::HTTP.new(uri.host, uri.port)
	  	https.read_timeout = @options[:timeout] if @options[:timeout]
	  	https.verify_mode = OpenSSL::SSL::VERIFY_NONE
	    https.use_ssl = true
	    request  = Net::HTTP::Get.new(uri.request_uri, @headers)
	    response = https.request(request)

	    # Response code error checking
      if response.code != '200'
        case response.code
        when '400'
          raise OptimizelyError::BadRequest, response.body + "Your request was not sent in valid JSON. (status code: #{response.code})."
        when '401'
          raise OptimizelyError::Unauthorized, "Your API token was missing or included in the body rather than the header (status code: #{response.code})."
        when '403'
          raise OptimizelyError::Forbidden, response.body + "You provided an API token but it was invalid or revoked, or if you don't have read/ write access to the entity you're trying to view/edit (status code: #{response.code})."
        when '404'
        	raise OptimizelyError::NotFound, response.body + "The id used in the request was inaccurate or you didn't have permission to view/edit it (status code: #{response.code})."
        else
          raise OptimizelyError::UnknownError, response.body + "(status code: #{response.code})."
        end
      else
		  	parse_json(response.body)
		  end
	  end

	  def post()

	  end

	  def put()

	  end

	  def delete()

	  end


	  private


		# If there is no API token or an empty API token raise an exception.
	  def check_init_auth_requirements
	  	if @options[:api_token].nil? || @options[:api_token].empty?
		    raise OptimizelyError::NoAPIToken, "An API token is required to initialize Optimizely."
		  else
		  	self.token = @options[:api_token]
		  end
	  end

	  # As the authentication for the Optimizely Experiments API is handled via the
	  # Token header in every request we set the header + also make clear we expect JSON.
	  def set_headers
	  	@headers = {}
	  	@headers['Token'] = @token
	  	@headers['Content-Type'] = "application/json"
	  end

	  # Parse the JSON data that's been requested through the get method.
	  def parse_json(data)
	  	json = JSON.parse(data)
	  	json
	  end
	end
end

module OptimizelyError
	# Authentication Error
	class NoAPIToken < StandardError; end;

	# Request Error
	class BadRequest < StandardError; end;
	class Unauthorized < StandardError; end;
	class Forbidden < StandardError; end;
	class NotFound < StandardError; end;
	class UnknownError < StandardError; end;

	# Request Error
	class NoProjectID < StandardError; end;
	class NoExperimentID < StandardError; end;
	class NoVariationID < StandardError; end;
	class NoAudienceID < StandardError; end;
end

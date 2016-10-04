module OptimizelyError
	# Authentication Error
	class NoAPIToken < StandardError; end;

	# Request Error
	class BadRequest < StandardError; end;
	class Unauthorized < StandardError; end;
	class Forbidden < StandardError; end;
	class NotFound < StandardError; end;
	class UnknownError < StandardError; end;

	# Missing Data Error
	class NoProjectID < StandardError; end;
	class NoDimensionID < StandardError; end;
	class NoExperimentID < StandardError; end;
	class NoVariationID < StandardError; end;
	class NoAudienceID < StandardError; end;
	class NoId < StandardError; end;
end

require 'test/unit'
require 'optimizely'

class OptimizelyTest < Test::Unit::TestCase

  TEST_API_KEY = ''

  def test_initialize_without_api_key
    assert_raise OptimizelyError::NoAPIToken do
      Optimizely.new({ api_token: nil })
    end
  end

  def test_retrieve_project_without_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoProjectID do
      optimizely.project(nil)
    end
  end

  def test_retrieve_experiment_without_project_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoProjectID do
      optimizely.experiments(nil)
    end
  end

  def test_retrieve_experiment_without_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoExperimentID do
      optimizely.experiment(nil)
    end
  end

  def test_retrieve_variations_without_experiment_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoExperimentID do
      optimizely.variations(nil)
    end
  end

  def test_retrieve_variation_without_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoVariationID do
      optimizely.variation(nil)
    end
  end

  def test_retrieve_audiences_without_project_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoProjectID do
      optimizely.audiences(nil)
    end
  end

  def test_retrieve_audience_without_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoAudienceID do
      optimizely.audience(nil)
    end
  end

  def test_retrieve_projects_forbidden
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::Forbidden do
      optimizely.projects
    end
  end

  def test_delete_no_id
    optimizely = Optimizely.new({ api_token: '1234567890:xxxxx' })
    assert_raise OptimizelyError::NoId do
      optimizely.delete
    end
  end
end

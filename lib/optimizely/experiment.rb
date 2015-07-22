module Optimizely
  class Experiment

    attr_reader :id, :project_id, :variation_ids, :edit_url, :status

    def initialize(json)
      @json = json
      @id = json['id']
      @project_id = json['project_id']
      @variation_ids = json['variation_ids']
      @edit_url = json['edit_url']
      @status = json['status']
    end

    def [](x)
      return @json[x]
    end

  end
end

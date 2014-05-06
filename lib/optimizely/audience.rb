module Optimizely
	class Audience

    attr_reader :id, :name, :project_id, :description

    def initialize(json)
      @id = json['id']
      @name = json['name']
      @project_id = json['project_id']
      @description = json['description']
    end

	end
end

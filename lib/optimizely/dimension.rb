module Optimizely
	class Dimension

    attr_reader :id, :name, :project_id, :description, :last_modified,
    						:client_api_name

    def initialize(json)
      @id = json['id']
      @name = json['name']
      @project_id = json['project_id']
      @description = json['description']
      @client_api_name = json['client_api_name']
      @last_modified = DateTime.parse(json['last_modified'])
    end

	end
end

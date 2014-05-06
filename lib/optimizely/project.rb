module Optimizely
	class Project

    attr_reader :project_name, :project_status, :id, :account_id

    def initialize(json)
      @project_name = json['project_name']
      @project_status = json['project_status']
      @id = json['id']
      @account_id = json['account_id']
    end

	end
end

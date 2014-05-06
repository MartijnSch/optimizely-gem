module Optimizely
	class Variation

    attr_reader :is_paused, :description, :weight, :created, :variation_id,
    						:section_id, :js_component, :experiment_id, :project_id, :id

    def initialize(json)
    	@is_paused = json['is_paused']
			@description = json['description']
			@weight = json['weight']
			@created = json['created']
			@variation_id = json['variation_id']
			@section_id = json['section_id']
			@js_component = json['js_component']
			@experiment_id = json['experiment_id']
			@project_id = json['project_id']
			@id = json['id']
    end

	end
end

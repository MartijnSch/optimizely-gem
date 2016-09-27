module Optimizely
  class Stat

    attr_reader :variation_id, :baseline_id, :goal_id, :status

    def initialize(json)
      @json = json
      @variation_id = json['variation_id']
      @baseline_id = json['baseline_id']
      @goal_id = json['goal_id']
      @status = json['status']
    end

    def [](x)
      @json[x]
    end

  end
end

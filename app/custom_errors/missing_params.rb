# frozen_string_literal: true

class MissingParams < StandardError
  def initialize(param_names)
    super("Missing parameters: #{param_names.join(', ')} ")
  end
end

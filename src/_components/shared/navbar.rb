class Shared::Navbar < Bridgetown::Component
  def initialize(metadata:, resource:, current_sprint:)
    @metadata, @resource = metadata, @current_sprint_url = current_sprint
  end
end

class Shared::Navbar < Bridgetown::Component
  def initialize(metadata:, resource:, current_sprint_url:)
    @metadata, @resource = resource, resource, @current_sprint_url = current_sprint_url
  end
end

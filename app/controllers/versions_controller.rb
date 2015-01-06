class VersionsController < ApplicationController
  def index
    @service = Service.find_by(slug: params[:service_slug])
    @versions = @service.versions
  end

  def show
    @service = Service.find_by(slug: params[:service_slug])
    @version = Version.find_by(service_id: @service.id)
    @organization = Organization.find_by(id: @service.organization_id)
    # @headers = Header.find_by(version_id: params[:version_id]).map(&:name)
    # Figure out headers
  end
end

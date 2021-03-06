class HeadersController < ApplicationController

  def index
    @service = Service.find_by(slug: params[:service_slug])
    @version = @service.versions.find_by(number: params[:id])
    @headers = @version.headers
  end

  def create
    @version = Version.find(params[:id])
    @headers = @version.headers
    @headers.each_with_index do |header, i|
      header.update(description: params[:headers][i][:description],
                    data_type: params[:headers][i][:data_type])
    end
    redirect_to "/services/#{@version.service.slug}/versions/#{@version.number}"
  end

end

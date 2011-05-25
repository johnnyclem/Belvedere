class OffloadProxiesController < ApplicationController
    def index
      @project = Project.find(params[:id])
       FileUtils.delay.cp_r "public/data/streaming/#{@project.id}/", "#{@project.offline}/streaming"
       respond_to do |format|
         format.html { redirect_to(project_path(:id => params[:id]))}
       end
    end
end
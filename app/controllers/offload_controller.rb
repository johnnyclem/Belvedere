class OffloadController < ApplicationController      
    def index
      @project = Project.find(params[:id])
       FileUtils.cp_r "public/data/#{@project.id}/", "#{@project.offline}"
       @project.archived = @project.offline
       @project.save
       respond_to do |format|
         format.html { redirect_to(project_path(:id => params[:id]))}
       end
    end
end
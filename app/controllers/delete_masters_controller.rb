class DeleteMastersController < ApplicationController
  def index
    @project = Project.find(params[:id])
     FileUtils.rm_r "public/data/#{@project.id}/"
     respond_to do |format|
       format.html { redirect_to(project_path(:id => params[:id]))}
     end
  end
end

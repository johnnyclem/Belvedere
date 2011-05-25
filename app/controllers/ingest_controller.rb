class IngestController < ApplicationController
  
  def index
    @project = Project.find(params[:id])
    path = params[:path] || "/Volumes"
    @dirs = []
    Dir.glob("#{path}/*").each do |p|
      @dirs << p if File.directory?(p)
    end
  end
  
    def create
      @project = Project.find(params[:id])
      Clip.process_directory(params[:path][:path], params[:path][:path], Project.find(params[:id]))
      %x(diskutil eject params[:path][:path])
      respond_to do |format|
        format.html { redirect_to(project_path(:id => params[:id]))}
      end
      
    end
end

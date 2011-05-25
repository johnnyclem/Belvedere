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
#      if @project.verification == 'md5'
#      then
      Clip.delay.process_directory(params[:path][:path], params[:path][:path], Project.find(params[:id]))
#    elsif @project.verification == 'size'
#      then
#      Clip.delay.process_directory_size(params[:path][:path], params[:path][:path], Project.find(params[:id]))
#    else
#    end
      respond_to do |format|
        format.html { redirect_to(project_path(:id => params[:id]))}
      end
      
    end
end

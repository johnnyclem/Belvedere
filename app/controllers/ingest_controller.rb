class IngestController < ApplicationController
  
  def index
    @project = Project.find(params[:id])
    path = params[:path] || "/Volumes"
    @dirs = []
    Dir.glob("#{path}/*").each do |p|
      @dirs << p if File.directory?(p)
    end
    
    respond_to do |format|
      format.html
    end
  end
  
    def create
      @project = Project.find(params[:id])
      t = Time.now
      @project.icount = t.strftime("%m%d%y_%H%M%p")
      FileUtils.mkdir_p("public/data/#{@project.id}/#{@project.icount}")
      FileUtils.cp_r("#{params[:path][:path]}/.", "public/data/#{@project.id}/#{@project.icount}")
      #project size calculation
      dirsize = 0
      Find.find("#{RAILS_ROOT}/public/data/#{@project.id}") do |f| dirsize += File.stat(f).size 
      end
      @project.size = dirsize
      @project.save
      #end project size calculation
      Clip.delay.process_directory(params[:path][:path], params[:path][:path], Project.find(params[:id]))
      
      
      respond_to do |format|
        format.html { redirect_to(project_path(:id => params[:id]))}
      end
      
    end
end

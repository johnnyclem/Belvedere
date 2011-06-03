class OffloadController < ApplicationController      
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
        FileUtils.cp_r("#{RAILS_ROOT}/public/data/#{@project.id}", params[:path][:path] )

        respond_to do |format|
          format.html { redirect_to(project_path(:id => params[:id]))}
        end

      end
  end

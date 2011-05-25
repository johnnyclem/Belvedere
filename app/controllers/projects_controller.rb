class ProjectsController < ApplicationController
  #can_edit_on_the_spot
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.csv { render :csv => @clips }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @project }
      wants.csv do
        csv_string = FasterCSV.generate do |csv|
          # header row
          csv << ["Name", "File Size in Bytes", "Running Time", "Resolution", "Notes", "MD5 Source", "MD5 Destination", "Project ID"]

          # data rows
          @project.clips.each do |clip|
            csv << [clip.clip_name, clip.size, (Time.mktime(0)+(clip.running_time || 0)).strftime("%Hh%Mm%Ss"), clip.resolution, clip.notes, clip.md5source, clip.md5dest, clip.project_id]
          end
        end

        # send it to the browsah
        send_data csv_string,
                  :type => 'text/csv; charset=iso-8859-1; header=present',
                  :disposition => "attachment; filename=#{@project.name}.csv"
      end
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    
    
#    FileUtils.mkdir "public/data/#{self.id}/"

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end
  


  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end

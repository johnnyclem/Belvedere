class ClipsController < ApplicationController

  can_edit_on_the_spot
  # GET /clips
  # GET /clips.xml
  
  
  def index
    @clips = Clip.order(params[:sort])
    respond_to do |wants|
      wants.html
      wants.csv do
        csv_string = FasterCSV.generate do |csv|
          # header row
          csv << ["Name", "File Size in Bytes", "Running Time", "Resolution", "Notes", "MD5 Source", "MD5 Destination", "Project ID"]

          # data rows
          @clips.each do |clip|
            csv << [clip.clip_name, clip.size, (Time.mktime(0)+(clip.running_time || 0)).strftime("%Hh%Mm%Ss"), clip.resolution, clip.notes, clip.md5source, clip.md5dest, clip.project_id]
          end
        end

        # send it to the browsah
        send_data csv_string,
                  :type => 'text/csv; charset=iso-8859-1; header=present',
                  :disposition => "attachment; filename=clips.csv"
      end
    end

  end
  # POST /clips
  # POST /clips.xml
  def create
    @clip = Clip.new(params[:clip])

    respond_to do |format|
      if @clip.save
        format.html { redirect_to(@clip, :notice => 'Clip was successfully created.') }
        format.xml  { render :xml => @clip, :status => :created, :location => @clip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clips/1
  # PUT /clips/1.xml
  def update
    @clip = Clip.find(params[:id])

    respond_to do |format|
      if @clip.update_attributes(params[:clip])
        format.html { redirect_to(@clip, :notice => 'Clip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @clip = Clip.find(params[:id])
    @clip.destroy

    respond_to do |format|
      format.html { redirect_to clips_path }
      format.js
    end
  end
  
  
end

class Clip < ActiveRecord::Base
require 'digest/md5'

  belongs_to :project
  
  def self.process_directory(upload, processdir, project)
    c = Clip.new(:project => project)
    if File.directory?(upload)
      Dir.glob("#{upload}/*").each do |f|
        Clip.process_directory(f, processdir, project)
      end
    else 
      c = Clip.create(:project => project)
      c.data_file(upload, processdir)
      c.save
    end
    #{}%x(diskutil eject \Storage) -- needs to happen after  Delayed::Job.count == 0
  end
  
#  def self.process_directory_size(upload, processdir, project)
#    c = Clip.new(:project => project)
#    if File.directory?(upload)
#      Dir.glob("#{upload}/*").each do |f|
#        Clip.process_directory(f, processdir, project)
#      end
#    else 
#      c = Clip.create(:project => project)
#      c.data_file(upload, processdir)
#      c.save
#    end
#  end
  
  def data_file(upload, processdir)    
    dest = Rails.root.join("public/data/#{self.project_id}/#{upload.gsub(processdir, "")}")
    digest = Digest::MD5.hexdigest(File.open(upload, "rb") { |b| b.read })     

    File.basename(upload)
    
    destdigest = Digest::MD5.hexdigest(File.open("#{dest}", "rb") { |b| b.read })    # MD5 Checksums the copied file(s) after copy
    movie = FFMPEG::Movie.new(upload)
    
    FileUtils.mkdir_p("public/data/streaming/#{self.project_id}") unless File.exists?("public/data/streaming/#{self.project_id}")
    self.clip_name = upload.gsub(processdir, "").slice(1..-1)
    if movie.valid?
      %x[qt_export --PICT "public/data/#{self.project.id}/#{self.clip_name}" "public/data/images/thumbs/#{self.clip_name}.jpg"  ]
#      options = {:video_codec => "libx264", :video_preset => "ultrafast", :resolution => "720x404"}
#      movie.transcode("public/data/streaming/#{self.project_id}/#{File.basename(upload.gsub(processdir, "").slice(1..-1))}.mp4", options) unless File.basename(upload).match /((.*)_F\.mov$)|((.*).THM$)|((.*).aif$)|((.*).aiff$)|((.*).AIF$)|((.*).AIFF$)|((.*).wav$)|((.*).WAV$)|((.*).CR2$)|((.*).R3D$)|((.*).mp3$)|((.*).MP3$)|((.*)_M\.mov$)|((.*)_P\.mov$)/
#      if movie.video_codec == "REDCODE"
       %x[qt_export --exporter=M4VP "public/data/#{self.project.id}/#{self.clip_name}" "public/data/streaming/#{self.project_id}/#{self.clip_name}.mp4"  ] unless self.clip_name.match /((.*)_F\.mov$)|((.*).THM$)|((.*).aif$)|((.*).aiff$)|((.*).AIF$)|((.*).AIFF$)|((.*).wav$)|((.*).WAV$)|((.*).CR2$)|((.*).R3D$)|((.*).mp3$)|((.*).MP3$)|((.*)_H\.mov$)|((.*)_P\.mov$)/
    else 
    end
      

    self.running_time = movie.duration || 0
    self.size = movie.size
    self.resolution = movie.resolution
    self.md5source = digest
    self.md5dest = destdigest
    if self.md5source == self.md5dest then self.md5_match = "1" else self.md5_match = "0" 
    end
  end
end

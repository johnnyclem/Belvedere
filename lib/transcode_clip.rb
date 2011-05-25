class TranscodeClip < Struct.new(:clip_id)
  def perform
    transcode = movie.transcode("public/data/streaming/#{self.project_id}/#{File.basename(upload.gsub(processdir, "").slice(1..-1))}.mp4")
    transcode.deliver
  end
end


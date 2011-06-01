class Project < ActiveRecord::Base
  has_many :clips
  has_many :ingests
#  validates :name, :length => { :maximum => 60 }
#  validates :director, :length => { :maximum => 30 }
#  validates :date, :length => { :maximum => 10 }
#  validates_numericality_of :unique_copies, :only_integer => true, :message => "Must Be A Whole Number i.e. 3"
#  validates_inclusion_of :unique_copies, :in => 1..6, :message => "| You Can Only Make Up To 6 Unique Copies"

  
  def ingest(path)
    Dir.glob(path).each do |listing|
      if listing.file?
        c = Clip.create(:datafile => listing)
        
      end
    end
  end  
end

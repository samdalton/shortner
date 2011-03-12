class Link
  include MongoMapper::Document

  key :title,     String
  key :url,       String
  key :slug,      String
  key :clicks,    Integer, :default => 0

  timestamps!

  # Validations.
  validates_presence_of :url, :slug
  
  def go
    self.increment(:clicks => 1)
    self.reload
    return url
  end
  
end
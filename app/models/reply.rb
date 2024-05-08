class Reply < Post
  after_initialize :set_default_type

  private

  def set_default_type
    self.type = 'Reply'
  end
end

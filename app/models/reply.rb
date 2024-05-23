class Reply < Post
  after_initialize :set_default_type

  private

  def set_default_type
    puts 'setting default'
    self.type ||= 'Reply'
  end
end

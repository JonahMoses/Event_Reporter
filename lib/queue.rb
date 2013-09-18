class Queue

  def initialize(input = {})
    # if we get an input set count = to input
      @count = input[:count] || 0
  end

  def count
    @count
  end

  # def load_file(input)
  #   asset = Assets.new
  #   asset.open_file(input)
  #   @content = asset.contents
  #   @count = @content.count
  # end

end
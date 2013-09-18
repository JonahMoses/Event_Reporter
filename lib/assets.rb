require 'csv'

class Assets

  def open_file(filename)
    @contents = CSV.read(filename, headers: true, header_converters: :symbol)
  end

  def contents
    @contents
  end

end
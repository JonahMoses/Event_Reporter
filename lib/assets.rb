require 'csv'

class Assets
  attr_reader :contents, :attendees

  def open_file(filename)
    @contents = CSV.read(filename, headers: true, header_converters: :symbol)
  end

  def row_names(contents)
    @attendees = contents.collect {|row| Attendees.new(row)}
    return @attendees
  end

end

class Attendees
  attr_reader :id, 
              :regdate,
              :first_name,
              :last_name, 
              :email_address,
              :homephone,
              :street,
              :city, 
              :state, 
              :zipcode

  def initialize(row)
    @id            = row[0]
    @regdate       = row[:regdate]
    @first_name    = row[:first_name]
    @last_name     = row[:last_name]
    @email_address = row[:email_address]
    @homephone     = formatted_phone_number(row[:homephone])
    @street        = row[:street]
    @city          = row[:city]
    @state         = row[:state]
    @zipcode       = clean_zipcode(row[:zipcode])
  end

  def clean_phone_numbers(homephone)
    homephone.tr!('^0-9', '')
    if homephone.length == 10
      homephone
    elsif (homephone.length < 10) || (homephone.length > 11)
      "0"*10
    elsif (homephone.length == 11) && (homephone[0] == "1")
      homephone[1..10]
    else
      "0"*10
    end
  end

  def formatted_phone_number(dirty_phone_numbers)
    cleaned_phone_numbers = clean_phone_numbers(dirty_phone_numbers)
    phone_number_digits  = cleaned_phone_numbers.to_s.split('')
    phone_area_code      = phone_number_digits[0..2].join
    phone_prefix         = phone_number_digits[3..5].join
    phone_suffix         = phone_number_digits[6..9].join
    formatted_phone      = "(#{phone_area_code}) #{phone_prefix}-#{phone_suffix}"
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end

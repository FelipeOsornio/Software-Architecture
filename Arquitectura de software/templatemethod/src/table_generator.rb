# Template Method Pattern
# Date: 24-Feb-2020
# Authors:
#          A01377154 Felipe Osornio 


# The source code contained in this file demonstrates how to
# implement the <em>template method pattern</em>.


# This class models an abstract table generator.
class TableGenerator

  # Init the constructor throughout their parameters.
  def initialize(header, data)
    @header = header
    @data = data
  end

  # Returns the row header plus the info of each row.
  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join
  end

  # Joins all elements of the header variable.
  def generate_header_row
    (@header.map {|x| generate_header_item(x)}).join
  end

  # Returns an item
  def generate_item(item)
    item
  end

  # Joins all elements of the row parameter.
  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end

  # Return a item of the header.
  def generate_header_item(item)
    item
  end

end

# A class that models a CSV table.
class CSVTableGenerator < TableGenerator

  # Joins all element of the row parameter with a comma.
  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end

  # Returns the generate_row with header as a parameter.
  def generate_header_row
    generate_row(@header)
  end

end

# A class that models a HTML table.
class HTMLTableGenerator < TableGenerator
    
    # Joins all element of the row parameter with a different table tags.
    def generate_row(row)
        @data.length != @data.index(row) + 1 ? 
          "<tr>
            #{(row.map {|x| "<td>#{generate_item(x)}</td>"}).join}
          </tr>\n" :
          "<tr>
            #{(row.map {|x| "<td>#{generate_item(x)}</td>"}).join}
          </tr>\n</table>\n"
    end
    
    # Returns each element of the header joined with table tags.
    def generate_header_row
        "<table>\n
          <tr>
            #{(@header.map {|x| "<th>#{generate_header_item(x)}</th>"}).join}
          </tr>\n"
    end
    
end

# A class that models an ASCII doc table.
class AsciiDocTableGenerator < TableGenerator

    # Joins all element of the row parameter with a different ASCII characters.
    def generate_row(row)
        @data.length != @data.index(row) + 1 ? 
          "#{(row.map {|x| "|#{generate_item(x)}"}).join}\n" :
          "#{(row.map {|x| "|#{generate_item(x)}"}).join}\n|==========\n"
    end
    
    # Returns each element of the header joined with ASCII characters.
    def generate_header_row
        "[options=\"header\"]\n|==========\n
          #{(@header.map {|x| "|#{generate_header_item(x)}"}).join}\n"
    end

end
require './sample_parser.tab.rb'

def lexical_analyze(str)
  tokens = str.split(/\s+/)
  res    = []
  tokens.each do |token|
    case token
    when '+'      
      res << ['+', '+']
    when '='
      res << ['=', '=']
    when /\d+/ 
      res << [:int, token]
    end
  end
  return res
end

def parse(tokens)
  parser = SampleParser.new
  return parser.parse(tokens)
end

p tokens = lexical_analyze('1 + 1 + 1 = 3')
p parse(tokens)

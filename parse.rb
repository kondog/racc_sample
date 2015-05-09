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

def syntax_parse(tokens)
  parser = SampleParser.new
  return parser.parse(tokens)
end

def syntax_analyze(syntaxed)
  return syntaxed if syntaxed.kind_of?(Fixnum)
  if syntaxed[2] == :add
    return syntax_analyze(syntaxed[0]) + syntax_analyze(syntaxed[1])
  end
end

def semantic_check(syntaxed)
  if syntaxed[0][2] == :equal
    return syntax_analyze(syntaxed[0][0]) == syntax_analyze(syntaxed[0][1])
  end
end

p tokens = lexical_analyze('1 + 1 + 1 = 3')
p parsed = syntax_parse(tokens)
p semantic_check(parsed)

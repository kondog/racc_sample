class SampleParser
    prechigh
        left    '+'
        left    '='
    preclow
    token int
rule
  EXP : int
        { p @stack; @stack << val[0].to_i }
      | EXP '+' EXP
        { p @stack; @stack << [@stack.pop, @stack.pop, :add] }
      | EXP '=' EXP
        { p @stack; @stack << [@stack.pop, @stack.pop, :equal] }

---- inner
def parse(tokens)
    @q      = tokens + [[false, '$']]
    @stack  = []
    do_parse
    return @stack
end

def next_token
    @q.shift
end


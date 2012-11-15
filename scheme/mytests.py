from scheme_reader import *
from buffer import Buffer, InputReader, LineReader
from scheme_tokens import tokenize_lines, DELIMITERS 
lines = ["(+ 1 ", "(+ 23 4)) ("]
src = Buffer(tokenize_lines(lines))
print(scheme_read(src))
print(repr(read_line("'hello")))
print(read_line("(car '(1 2))"))


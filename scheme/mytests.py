from scheme_reader import *
from buffer import Buffer, InputReader, LineReader
from scheme_tokens import tokenize_lines, DELIMITERS 

lines = ["(+ 1 ", "(+ 23 4)) ("]
src = Buffer(tokenize_lines(lines))
print(scheme_read(src))
print(repr(read_line("'hello")))
print(read_line("(car '(1 2))"))

print(repr(read_tail(Buffer(tokenize_lines([")"])))))
print(repr(read_tail(Buffer(tokenize_lines(["2 3)"])))))
print(repr(read_tail(Buffer(tokenize_lines(["2 (3 4))"])))))
print(repr(read_line("(1 . 2)")))
print(repr(read_line("(1 2 . 3)")))
print(repr(read_line("(1 . 2 3)")))
print(repr(scheme_read(Buffer(tokenize_lines(["(1", "2 .", "'(3 4))", "4"])))))


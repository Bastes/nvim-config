increment numbers in a file (ex: increment all "QXXX" numbers where XXX is between 000 and 999, Q000 -> Q001, ... , Q199 -> Q200, ...)
```
:%s/Q\(\d\d\d\)/\='Q' . printf('%0*d', 3, str2nr(submatch(1)) + 1)/g
```

`\=` allows for scripting in the replacement
`printf('***************%0*d', 3, ...)` zero pads the resulting number to 3 digits
`str2nr(...)` casts the captured portion as a base-10 integer

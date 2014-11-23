## How to read the nth line of a Parsed html in R
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
con = url(url)
htmlcode = readLines(con)
close(con)
nchar(htmlcode[11])
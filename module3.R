dir.create("./resources/data/wordcloud", recursive=TRUE)
download.file("https://ibm.box.com/shared/static/cmid70rpa7xe4ocitcga1bve7r0kqnia.txt",
              destfile = "./resources/data/wordcloud/churchill_speeches.txt", quiet = TRUE)

# Installing the required packages
install.packages("tm") # for text mining
install.packages("wordcloud") # word-cloud generator
install.packages("dplyr")
install.packages("devtools")

# Loading the libraries into the environment.
library(tm)
library(wordcloud) 

# Select the directory that our text is located
dirPath <- "./resources/data/wordcloud/"

# Load the data as a corpus
speech <- Corpus(DirSource(dirPath))

inspect(speech) # to inspect the content

# Convert the text to lower case
speech <- tm_map(speech, content_transformer(tolower))

# Remove numbers
speech <- tm_map(speech, removeNumbers)

# Remove english common stopwords
speech <- tm_map(speech, removeWords, stopwords("english"))

# Remove your own stop word
# specify your stopwords as a character vector
speech <- tm_map(speech, removeWords, c("floccinaucinihilipification", "squirrelled")) 

# Remove punctuations
speech <- tm_map(speech, removePunctuation)

# Eliminate extra white spaces
speech <- tm_map(speech, stripWhitespace)

# Create a Term Document Matrix
dtm <- TermDocumentMatrix(speech)

# Matrix transformation
m <- as.matrix(dtm)

#Sort it to show the most frequent words
v <- sort(rowSums(m),decreasing=TRUE)

#transform to a data frame
d <- data.frame(word = names(v),freq=v)
head(d, 10)

wordcloud(words = d$word, freq = d$freq)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=250, colors=brewer.pal(8, "Dark2"), random.order = FALSE )

install.packages("plotly")
library(plotly)

#making the results reproducible
set.seed(1234)

set_a <- rnorm(200, mean=1, sd=2)
set_b <- rnorm(200, mean=0, sd=1)

#create the data frame
df <- data.frame(label = factor(rep(c("A","B"), each=200)), value = c(set_a, set_b))

#output both the first and last rows
head(df)
tail(df)

ggplot(df, aes(x=label, y=value)) + geom_boxplot()

ggplotly()
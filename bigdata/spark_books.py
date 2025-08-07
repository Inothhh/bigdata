from pyspark import SparkContext

sc = SparkContext("local", "BooksAnalyse")
rdd = sc.wholeTextFiles("data_books/*")

# Analyse simple sur tous les livres
all_words = rdd.flatMap(lambda file: file[1].split()).map(lambda word: (word.lower(), 1))
word_count = all_words.reduceByKey(lambda a, b: a + b)

top_words = word_count.takeOrdered(20, key=lambda x: -x[1])
print("Top mots dans tous les livres :", top_words)

sc.stop()

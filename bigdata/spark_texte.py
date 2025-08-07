from pyspark import SparkContext

sc = SparkContext("local", "TextAnalyse")
rdd = sc.textFile("shakespeare.txt")
words = rdd.flatMap(lambda line: line.split())
counts = words.map(lambda word: (word.lower(), 1)).reduceByKey(lambda a, b: a + b)
top_words = counts.takeOrdered(10, key=lambda x: -x[1])

print("Top mots :", top_words)
sc.stop()

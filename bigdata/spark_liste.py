from pyspark import SparkContext

sc = SparkContext("local", "ListManip")
liste = [1, 2, 3, 4, 5]*1000000
rdd = sc.parallelize(liste)

print("Nombre total :", rdd.count())
print("Somme :", rdd.reduce(lambda x, y: x + y))
print("Double des valeurs :", rdd.map(lambda x: x*2).take(5))

sc.stop()

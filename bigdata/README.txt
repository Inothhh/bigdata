# Module Big Data - Instructions d'utilisation

## Étapes à suivre :

### 1. Activer ton environnement virtuel
```bash
source ~/envs/bigdata/bin/activate
```

### 2. Lancer un des scripts avec Spark

#### Pour manipuler des listes :
```bash
python spark_liste.py
```

#### Pour analyser un texte :
Télécharge d'abord un fichier texte comme celui-ci :
```bash
wget https://www.gutenberg.org/cache/epub/1430/pg1430.txt -O shakespeare.txt
```
Puis lance :
```bash
python spark_texte.py
```

#### Pour analyser plusieurs fichiers :
Décompresse le fichier `data.zip` dans un dossier `data_books`, puis lance :
```bash
python spark_books.py
```

### 3. Observer l'interface web Spark :
Ouvre [http://localhost:4040](http://localhost:4040) dans ton navigateur pendant l'exécution des scripts.

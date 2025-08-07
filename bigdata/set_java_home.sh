#!/bin/bash

# Trouver automatiquement le chemin de Java
JAVA_PATH=$(readlink -f $(which java) | sed "s:/bin/java::")

# Afficher le chemin détecté
echo "JAVA détecté dans : $JAVA_PATH"

# Ajouter au .bashrc si pas déjà présent
if ! grep -q "export JAVA_HOME=" ~/.bashrc; then
    echo "export JAVA_HOME=\"$JAVA_PATH\"" >> ~/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
    echo "✅ JAVA_HOME ajouté à ~/.bashrc"
else
    echo "⚠️ JAVA_HOME existe déjà dans ~/.bashrc"
fi

# Exporter les variables pour la session actuelle
export JAVA_HOME="$JAVA_PATH"
export PATH=$JAVA_HOME/bin:$PATH

echo "✅ JAVA_HOME est maintenant défini : $JAVA_HOME"

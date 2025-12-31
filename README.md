# 🛡️ Shielder : Code Binaire

> [!WARNING]  
> **Binary Shielder** est voué à être utilisé dans un cours d'informatique, et n'est pas un véritable outil.

Le **Binary Shielder** est un template pour créer un POC de shielder pour code binaire. Il contient un projet _TypeScript_ préconfiguré.

## ⚡ Démarrage Rapide

Le projet peut être initialisé avec l'outil **NPM**, en exécutant la commande :

```bash
npm install
npm run generate-parser
```

L'outil peut ensuite être lancé en utilisant :

```bash
npm start <chemin-vers-fichier-apk>
```

Par exemple :
```bash
npm start /path/to/app-debug.apk
```

## 🎯 Fonctionnalités

Cet outil implémente un système d'injection automatique de détecteurs de sécurité dans des APK Android au niveau binaire. Le processus complet inclut :

### Étape 1-2 : Paramétrage
- Accepte un fichier APK en paramètre de ligne de commande
- Valide l'existence du fichier APK

### Étape 3 : Décompilation
- Décompile l'APK avec Apktool
- Extrait tous les fichiers Smali et ressources

### Étape 4 : Injection des détecteurs
- Parse le fichier AndroidManifest.xml pour identifier l'activité principale
- Injecte le fichier SecurityDetectors.smali dans le bon package

### Étape 5 : Analyse AST
- Parcourt tous les fichiers Smali avec le parser généré par ANTLR
- Localise le fichier MainActivity.smali correspondant à l'activité principale

### Étape 6 : Modification du code
- Localise la méthode onCreate dans MainActivity
- Trouve l'appel à super.onCreate()
- Injecte les appels aux détecteurs de sécurité juste après super.onCreate()

### Étape 7 : Reconstruction
- Reconstruit l'APK avec toutes les modifications
- Génère un fichier `*_modified.apk` prêt à être signé et installé

## 📋 Prérequis

- **Node.js** (version 14 ou supérieure)
- **Apktool** installé et accessible dans le PATH
- Fichier **SecurityDetectors.smali** dans `src/assets/`
  - Ce fichier doit être généré à partir de l'exercice 4
  - Contient les détecteurs de sécurité compilés en Smali

## 🧰 Librairies Incluses

### 📜 *Android Manifest* parser

Dans le but d'amorcer rapidement le parsing du fichier *Android Manifest*, un librairie est include directement dans le projet.

### ⛏️ *Smali* parser

Afin de réaliser le parsing de fichier *Smali*, la grammaire de ce langage au format *ANTLR* est incluse dans le projet. La commande `npm run generate-parser` permet de générer automatiquement le code du parser correspondant à cette grammaire.

### ✏️ Réécriture du *Smali*

Afin de récupérer le *Smali* sous sa forme textuelle après sa convertion en AST, une librairie permettant de faire la convertion inverse est incluse dans le projet. Un exemple d'utilisation du *SmaliParser* et du *SmaliWriter* est présent dans le fichier `index.ts`. Un deuxième paramètre optionel est possible pour la fonction `SmaliWriter.write()` afin de définir un fichier cible à la place de l'affichage dans la console.

## 📦 Sortie

Après exécution, l'outil génère :

- **Dossier décompilé** : `{nom-apk}_decompiled/`
  - Contient tous les fichiers Smali décompilés
  - Inclut le SecurityDetectors.smali injecté
  - MainActivity.smali modifié avec les appels de sécurité

- **APK modifié** : `{nom-apk}_modified.apk`
  - APK reconstruit avec toutes les modifications
  - **Non signé** - nécessite une signature avant installation

## 🔧 Prochaines étapes

Après génération de l'APK modifié :

1. **Signer l'APK** (obligatoire pour l'installation)
   ```bash
   # Avec jarsigner
   jarsigner -keystore debug.keystore app-debug_modified.apk androiddebugkey

   # Ou avec apksigner
   apksigner sign --ks debug.keystore app-debug_modified.apk
   ```

2. **Installer sur l'émulateur/appareil**
   ```bash
   adb install app-debug_modified.apk
   ```

3. **Tester l'application**
   - Lancer l'application
   - Vérifier que les détecteurs de sécurité s'exécutent au démarrage 
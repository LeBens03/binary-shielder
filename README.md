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
npm run start
```

## 🧰 Librairies Incluses

### 📜 *Android Manifest* parser

Dans le but d'amorcer rapidement le parsing du fichier *Android Manifest*, un librairie est include directement dans le projet.

### ⛏️ *Smali* parser

Afin de réaliser le parsing de fichier *Smali*, la grammaire de ce langage au format *ANTLR* est incluse dans le projet. La commande `npm run generate-parser` permet de générer automatiquement le code du parser correspondant à cette grammaire.

### ✏️ Réécriture du *Smali*

Afin de récupérer le *Smali* sous sa forme textuelle après sa convertion en AST, une librairie permettant de faire la convertion inverse est incluse dans le projet. Un exemple d'utilisation du *SmaliParser* et du *SmaliWriter* est présent dans le fichier `index.ts`. Un deuxième paramètre optionel est possible pour la fonction `SmaliWriter.write()` afin de définir un fichier cible à la place de l'affichage dans la console. 
# 🎓 Application de Gestion des Étudiants (Projet d'Apprentissage Flutter)

Projet d'initiation et de prise en main du framework **Flutter** et du langage **Dart**. L'objectif principal de cette application est de pratiquer les concepts fondamentaux du développement mobile cross-platform à travers un cas pratique de gestion de liste.

---

## 🎯 Objectifs Pédagogiques & Notions Abordées

Ce projet vise à comprendre et manipuler les bases essentielles de Flutter :

- **Composants d'interface (Widgets)** : Utilisation de `Scaffold`, `ListView.builder`, `ListTile`, `Card`, `CircleAvatar` et `TextField`.
- **Gestion d'état locale** : Utilisation de `StatefulWidget` et rechargement de l'interface via `setState()`.
- **Navigation inter-écrans** : Passage de données entre les pages via `Navigator.push` et `Navigator.pop`.
- **Gestion des formulaires** : Contrôle de la saisie utilisateur avec `TextEditingController` et libération des ressources (`dispose`).
- **Interactions & Modales** : Confirmation de suppression avec une boîte de dialogue `AlertDialog`.

---

## 💡 Fonctionnalités de l'Application

- 📋 **Affichage** d'une liste dynamique d'étudiants.
- ➕ **Ajout** d'un nouvel étudiant via un formulaire.
- 🔍 **Consultation** de la fiche détaillée d'un étudiant.
- 🗑️ **Suppression** d'un étudiant avec demande de confirmation.

---

## 📂 Structure du Code

```text
lib/
└── main.dart   # Modèle Etudiant et implémentation des différents écrans (Accueil, Formulaire, Détails)
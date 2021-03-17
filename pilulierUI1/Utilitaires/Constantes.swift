//
//  Constantes.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 27/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

//Les noms de fichier
let AMM_FILE = "CIS_bdpm_reduit_pipe"
let PATIENTS_FILE = "patients"
// Le fihier d'un patient nommé Patient sera
let PATIENT_UNIQUE_FILE = "patient" // + Patient, le nom du patient
let PATIENT = "patient"


// Les titres de page
let TITRE_PAGE_PATIENTS = "Les patients..."

//Les boutons...
let BTN_ENREGISTRER = "Enregistrer"

// let routines
let MATIN = "Matin"
let MIDI = "Midi"
let SOIR = "Soir"
let NUIT = "Nuit"

let MOMENTS_DU_JOUR = [MATIN,MIDI,SOIR,NUIT]

// Textes longs
let HELPA = """
Pill box makes it possible to manage the medical prescriptions of patients.
When using the application for the first time, you must create at least one patient. Patients appear in a list. You can select the current patient from this list.

Now, the application will open on the current patient's list of prescriptions.
The icons in the navigation bar provide access to:
- the list of patients
- the list of medicines used.
- export the prescription list of this patient. This function can be used by the doctor to send a list of prescriptions to a caregiver or to a patient.

From the page of a particular patient, you can register and manage the prescription list.
The button "Create a weekly pillbox" makes it possible to display the pillbox of the 7 days to come.

Prescription entry page,
"""

let HELPF1 = """
Pilulier permet de gérer les prescriptions médicales de patients
Lors de la première utilisation, vous devez créer au moins un patient. Les patients apparaissent dans une liste. Vous pouvez choisir le patient courant dans cette liste.
Lorsqu’un patient courant est défini, l’application s’ouvre sur la liste de prescriptions de cette liste.

Les icônes dans la barre de navigation permettent d'accéder à :
    - la liste des patients
    - la liste des médicaments utilisés.
    - exporter la liste de prescriptions de ce patient. Cette fonction peut servir au médecin pour transmettre à un soignant ou à un patient une liste de prescriptions.

Depuis la page d'un patient particulier, on peut enregistrer et gérer la liste des prescriptions.
Le bouton "Créer un pilulier hebdomadaire" permet d'afficher le pilulier des 7 jours à venir.

Dans la page de saisie des prescriptions,

La page listant les patients permet d'importer une liste de prescriptions pour un patient particulier. Si ce patient existe déjà, on ajoutera les prescriptions qui n'étaient pas déjà présentes, Sinon, elle créera ce patient.

"""

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

// Textes longs
let HELP = """
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

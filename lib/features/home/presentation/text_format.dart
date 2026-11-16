/// Met la première lettre en majuscule (jours et mois sont en minuscules).
String capitalize(String value) =>
    value.isEmpty ? value : value[0].toUpperCase() + value.substring(1);

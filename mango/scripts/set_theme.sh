#!/bin/bash
swaync-client -t
# 1. Seleziona il wallpaper usando zenity e salvalo nella variabile
wallpaper_path=$(zenity --width 1200 --height 600 --file-selection --filename="$HOME/.config/hypr/wallpapers/" --title='Choose a Wallpaper!')

# 2. DEBUG: Stampa il percorso selezionato
echo "Percorso selezionato da Zenity: $wallpaper_path"

# 3. Controlla se è stato scelto un file (variabile non vuota)
if [ -n "$wallpaper_path" ]; then
    echo "Il percorso è valido. Esecuzione di matugen..."
    
    # 4. Imposta lo sfondo con matugen
    matugen image "$wallpaper_path"
    
    # 5. DEBUG: Controlla lo stato di uscita di matugen
    if [ $? -eq 0 ]; then
        echo "matugen completato con successo."
    else
        echo "matugen ha fallito. Codice di errore: $?"
    fi
else
    echo "Selezione annullata o nessun file scelto."
fi
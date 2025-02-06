#!/bin/bash
IMG_PATH="/home/pancho/Imagenes/wallpaper/deapool-wallpaper-3840x2160.jpg"
# Verifica si wal generó los archivos de colores
if [ ! -f "$HOME/.cache/wal/colors.sh" ]; then
  echo "No se han generado los colores con wal. Ejecuta wal -i <imagen> primero."
  wal -i "$IMG_PATH" -o ~/scripts/apply-colors-hypr.sh
fi

# Crea el archivo colors-hypr.conf
cat << EOF > ~/.config/hypr/colors-hypr.conf
# Paleta generada por wal
background = $(awk 'NR==1 {print $3}' ~/.cache/wal/colors.sh)
foreground = $(awk 'NR==2 {print $3}' ~/.cache/wal/colors.sh)
accent = $(awk 'NR==3 {print $3}' ~/.cache/wal/colors.sh)
border = $(awk 'NR==4 {print $3}' ~/.cache/wal/colors.sh)
# Si necesitas más colores, puedes añadirlos manualmente aquí.
EOF

echo "Archivo colors-hypr.conf generado correctamente."

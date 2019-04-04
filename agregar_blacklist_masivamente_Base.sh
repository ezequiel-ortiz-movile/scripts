#! /bin/bash
lista_ticket=$1
#anis=(lista_de_anis_param)
#EN CASO DE DAR DE BAJA A UNA APP_ID EN PARTICULAR, EDITAR EL TEXTO DE ABAJO
#Application_id=0
#&applicationId=$Application_id ->agregar al final de la cadena "url"
carrier_ok=$2
total_de_anis=$( awk '{x++}END{print x}' /home/ezequiel.ortiz/lista_anis_masivos_a_consumir/$lista_ticket)
echo "total de anis: $total_de_anis\n"
while read linea;
do
   #DAR DE BAJA
   url="curl -X PUT http://listanera2.datac.movile.com:12000/listanera/${linea}/method/${lista_ticket}/?carrierId=${carrier_ok}"
   rc=$(curl -s $url)
   echo -e "'$linea'," >>/home/ezequiel.ortiz/script_logs/log_blacklist_ani_masivos_${lista_ticket}_lista_ok_resultante.txt
   let "progreso++"
   echo "$progreso/$total_de_anis"
done < /home/ezequiel.ortiz/lista_anis_masivos_a_consumir/$lista_ticket


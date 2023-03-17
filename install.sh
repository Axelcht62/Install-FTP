#!/bin/bash
# Verification des droits administrateur
if [ "$EUID" -ne 0 ]
then echo "Executer ce script en tant qu'administrateur"
exit
fi
    # Installation de pure-ftpd
apt update
apt install filezilla
apt install pure-ftpd -y
    # Configuration de pure-ftpd
cat <<EOT >> /etc/ftp.conf
    # Activer le mode anonyme
anonymous_enable=YES
    # Interdire l'ecriture en mode anonyme
anon_upload_enable=NO
anon_mkdir_write_enable=NO
    # Limiter l'acces en lecture seule
anon_world_readable_only=YES
EOT
    # Redemarrage du service pure-ftpd
systemctl restart pure-ftpd

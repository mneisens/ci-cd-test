git pull
git add .
git commit -m "$*"
git push

# FTP Upload zu All-Inkl
echo "Uploading to All-Inkl FTP server..."

# All-Inkl FTP Upload mit lftp
# Installieren Sie lftp falls noch nicht vorhanden: brew install lftp
lftp -u f0172b6e,fubbi4-keqfoh-hEndot ftp.all-inkl.com -e "
set ftp:ssl-allow no;
cd /ci-cd.michael-neisens.de/;
mput *.html;
quit
"

echo "Files uploaded to All-Inkl FTP server"
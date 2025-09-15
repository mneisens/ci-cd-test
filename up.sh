git pull
git add .
git commit -m "$*"
git push

# FTP Upload zu All-Inkl
echo "Uploading to All-Inkl FTP server..."

# All-Inkl FTP Upload mit lftp
# Installieren Sie lftp falls noch nicht vorhanden: brew install lftp
# Probiere verschiedene All-Inkl FTP Server
echo "Versuche verschiedene All-Inkl FTP Konfigurationen..."

# Option 1: Hauptdomain FTP Server (häufigster Fall)
lftp -u f0172b6e,fubbi4-keqfoh-hEndot michael-neisens.de -e "
set ftp:ssl-allow no;
set ftp:passive-mode on;
cd /ci-cd.michael-neisens.de/;
mput *.html;
quit
" || echo "Option 1 fehlgeschlagen"

# Option 2: Standard All-Inkl FTP
lftp -u f0172b6e,fubbi4-keqfoh-hEndot ftp.michael-neisens.de -e "
set ftp:ssl-allow no;
set ftp:passive-mode on;
cd /ci-cd.michael-neisens.de/;
mput *.html;
quit
" || echo "Option 2 fehlgeschlagen"

# Option 3: All-Inkl Standard mit anderem Pfad
lftp -u f0172b6e,fubbi4-keqfoh-hEndot michael-neisens.de -e "
set ftp:ssl-allow no;
set ftp:passive-mode on;
cd /;
lcd .;
mput *.html;
quit
" || echo "Option 3 fehlgeschlagen"

echo "Files uploaded to All-Inkl FTP server"
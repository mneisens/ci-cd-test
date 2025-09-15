git pull
git add .
git commit -m "$*"
git push

# FTP Upload zu All-Inkl
echo "Uploading to All-Inkl FTP server..."

# All-Inkl FTP Upload mit lftp
# Installieren Sie lftp falls noch nicht vorhanden: brew install lftp
# All-Inkl FTP Upload - Multiple Pfade für Subdomain
echo "Uploading to multiple possible subdomain paths..."

# Pfad 1: Standard Subdomain-Verzeichnis
lftp -u f0172b6e,fubbi4-keqfoh-hEndot michael-neisens.de -e "
set ftp:ssl-allow no;
set ftp:passive-mode on;
cd /ci-cd.michael-neisens.de/;
mput *.html;
quit
" && echo "✅ Upload zu /ci-cd.michael-neisens.de/ erfolgreich"

# Pfad 2: Subdomain unter Hauptdomain
lftp -u f0172b6e,fubbi4-keqfoh-hEndot michael-neisens.de -e "
set ftp:ssl-allow no;
set ftp:passive-mode on;
cd /michael-neisens.de/;
mkdir -p ci-cd;
cd ci-cd;
mput *.html;
quit
" && echo "✅ Upload zu /michael-neisens.de/ci-cd/ erfolgreich"

# Pfad 3: Root-Verzeichnis (falls Subdomain darauf zeigt)
lftp -u f0172b6e,fubbi4-keqfoh-hEndot michael-neisens.de -e "
set ftp:ssl-allow no;
set ftp:passive-mode on;
cd /;
mput *.html;
quit
" && echo "✅ Upload zu Root-Verzeichnis / erfolgreich"

echo "Files uploaded to All-Inkl FTP server"
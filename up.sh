git pull
git add .
git commit -m "$*"
git push

# FTP Upload (bitte Ihre FTP-Zugangsdaten anpassen)
echo "Uploading to FTP server..."
# Beispiel mit lftp (installieren Sie es mit: brew install lftp)
# lftp -u username,password ftp.ihredomain.de -e "mirror --reverse --delete --verbose . /path/to/webroot; quit"

# Beispiel mit rsync über SSH (falls verfügbar)
# rsync -avz --delete ./ username@server:/path/to/webroot/

# Beispiel mit scp (falls SSH verfügbar)
# scp -r ./*.html username@server:/path/to/webroot/

echo "FTP Upload configuration needed - please edit up.sh with your FTP credentials"
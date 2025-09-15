git pull
git add .
git commit -m "$*"
git push

# Elegantes FTP Upload mit git-ftp
echo "🚀 Deploying to All-Inkl FTP server with git-ftp..."
git ftp push --remote-root /ci-cd.michael-neisens.de/
echo "✅ Deployment completed successfully!"
# ebpi



edit delay-sendemail file

echo `date` > /tmp/mailbody.txt
curl 'https://api.ipify.org?format=json' >> /tmp/mailbody.txt
echo  ...  >> /tmp/mailbody.txt
ifconfig | grep "inet addr" | grep -v 127.0.0.1 >> /tmp/mailbody.txt
sendemail -l ~/email.log     \
    -f "FROM <- enter here from email address"   \
    -u "PI tunnel connected"     \
    -t "TO <- enter here to email address" \
    -s "smtp.gmail.com:587"  \
    -o tls=yes \
    -xu "FROM account <- enter here from email address account username" \
    -xp "FROM account password <- enter here from email password" \
    -o message-file="/tmp/mailbody.txt"

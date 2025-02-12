NAME=poetize-server

USERNAME=root
PASSWORD=poetize

echo "开始部署项目：$NAME"

ID=`ps -ef | grep "$NAME" | grep -v "$0" | grep -v "grep" | awk '{print $2}'`
echo $ID

for id in $ID
do
kill -9 $id
echo "killed $id"
done
echo "---------------"

sleep 3

nohup java -jar -Xms512m -Xmx1024m -Xmn256m -Xss256k /home/poetize/poetize-server/poetize-server.jar --spring.datasource.username=$USERNAME --spring.datasource.password=$PASSWORD >/dev/null 2>&1 &

echo "$NAME：部署完成"
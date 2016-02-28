restore=$1
backDir="/home/eaauser/backups"
restoreDir="/home/eaauser/restore"
backup="/home/eaauser/eaa/Week4"
logs="/home/eaauser/eaa/logs"
log="$logs/log.txt"
now=`date '+%d/%m/%Y %H:%M:%S'`

if [ ! -d "$logs" ]; then
  mkdir $logs
  touch $log
  printf "Time: $now\nLog created\n" >> $log
fi

if [ "$restore" != "restore" ]; then
  if [ ! -d "$backDir" ]; then
     mkdir $backDir
     printf "Time: $now\nBackup created in $backDir\n" >> $log
     tar -cvzf $backDir/backup.tar.gz $backup
  else
     tar -cvzf $backDir/backup.tar.gz $backup
     printf "Time: $now\nBackup created in $backDir\n" >> $log
  fi
fi


if [ "$restore" == "restore" ]; then
  if [ ! -d  "$restoreDir" ]; then
    mkdir $restoreDir
    tar -zxvf $backDir/backup.tar.gz -C $restoreDir
    printf "Time: $now\nBackup restored in $restoreDir\n" >> $log
  else
    tar -zxvf $backDir/backup.tar.gz -C $restoreDir
    printf "Time: $now\nBackup restored in $restoreDir\n" >> $log
  fi
fi

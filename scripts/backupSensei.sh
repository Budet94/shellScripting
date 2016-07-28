###########################################################################
#!/bin/sh
# /u01/app/Scripts/backup.sh
#
# Backup the data and configuration as compressed files.
# Also backup the entire directory and daemon configuration.
#
# GG version 1
# 07072016
# Gokhan
############################################################################

set -x
set -v
standby=$1
umask 022

PATH="/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin"
export PATH

DATE=`date +%Y%m%d`

BACKUP_DIR="/iambackup/"

BACKUP_DATA_FILENAME="/u01/app/fmw_productR1/.${DATE}.ldif"
BACKUP_TAR_FILENAME="fmw_productR1.${DATE}.tar.gz"
#BACKUP_DATA_FILENAME="/u01/app/fmw_productR3/.${DATE}.ldif"
#BACKUP_CONFIG_FILENAME=".config.${DATE}.ldif"

#LOG_ROTATION="/etc/logrotate.d/admin"
LOGFILE="/u01/app/fmw_productR1"

#KEEP="30"

# Make sure we have a log file.
if [ ! -f ${LOGFILE} ]; then
 touch ${LOGFILE}
  if [ "$?" -ne "0" ]; then
  echo "ERROR: could not create the log file."
  exit 1
 fi
fi

# Check if root is running this script.
#if [ `id -u` -ne "0" ]; then
 #echo "ERROR: only root can run this script." | tee -a ${LOGFILE}
 #exit 1
#fi

# Make sure we have a backup directory.
if [ ! -d ${BACKUP_DIR} ]; then
 mkdir -p ${BACKUP_DIR}
  if [ "$?" -ne "0" ]; then
  echo "ERROR: could not create the backup directory." | tee -a ${LOGFILE}
  exit 1
 fi
fi

# Make sure we don't have too much backup files piling up in our backup directory.
#FILES=`find ${BACKUP_DIR} -type f -name "admin.*" -print | wc -l`
#if [ "${FILES}" -gt "${KEEP}" ]; then
#  OVER=`echo ${FILES}-${KEEP} | bc`
# RMFILES=`find ${BACKUP_DIR} -type f -name "admin.*" -print | sort -r | tail -${OVER}`
# echo "NOTE: removing ${RMFILES} from the backup directory." >> ${LOGFILE}
# rm ${RMFILES}
#fi

# Backup the DIT data.
#slapcat ${SLAPCAT_OPTIONS} -b ${DIT_SUFFIX} -l ${BACKUP_DIR}/${BACKUP_DATA_FILENAME} >/dev/null 2>&1
#if [ "$?" -eq "0" ]; then
#  gzip -f ${BACKUP_DIR}/${BACKUP_DATA_FILENAME} 2>&1 >> ${LOGFILE}
#  if [ "$?" -ne "0" ] ; then
#  echo "ERROR: dump file compression problem." | tee -a ${LOGFILE}
#  exit 1
# fi
#else
# echo "ERROR: problem running slapcat(8C) for the DIT data backup." | tee -a ${LOGFILE}
# rm ${BACKUP_DIR}/${BACKUP_DATA_FILENAME}
# exit 1
#fi

# Backup the DIT config as an LDIF file.
#slapcat ${SLAPCAT_OPTIONS} -b ${DIT_CONFIG} -l ${BACKUP_DIR}/${BACKUP_CONFIG_FILENAME} >/dev/null 2>&1
#if [ "$?" -eq "0" ]; then
#  gzip -f ${BACKUP_DIR}/${BACKUP_CONFIG_FILENAME} 2>&1 >> ${LOGFILE}
#  if [ "$?" -ne "0" ] ; then
#  echo "ERROR: dump file compression problem." | tee -a ${LOGFILE}
#  exit 1
# fi
#else
# echo "ERROR: problem running slapcat(8C) for the DIT config backup." | tee -a ${LOGFILE}
# rm ${BACKUP_DIR}/${BACKUP_CONFIG_FILENAME}
# exit 1
#fi

# Backup the entire configuration directory.
#BACKUP_FILES_LIST="${admin}"
#
#tar zcf ${BACKUP_DIR}/${BACKUP_TAR_FILENAME} ${BACKUP_FILES_LIST} >/dev/null 2>&1
#
#if [ "$?" -ne "0" ]; then
# echo "ERROR: problem running config directory tar." | tee -a ${LOGFILE}
# rm ${BACKUP_DIR}/${BACKUP_TAR_FILENAME}
# exit 1
#fi
#
# EOF

/*******************************************************************************
Make sure this new script is executable.

sudo chmod a+x /root/scripts/backup.slapd.sh

Place the script in root's crontab.

sudo crontab -e

# root's crontab
# 
# The time and date fields are:
# 
#  field          allowed values
#  -----          --------------
#  minute         0-59
#  hour           0-23
#  day of month   1-31
#  month          1-12 (or names, see below)
#  day of week    0-7 (0 or 7 is Sun, or use names)

# Backup the OpenLDAP data, config, directory and daemon config.
00 22 * * * /root/scripts/backup.slapd.sh

# EOF

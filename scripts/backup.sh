#!/bin/bash

# Project 5 - Linux Backup Automation

PROJECT_DIR="$HOME/linux-backup-automation"
SOURCE_DIR="$PROJECT_DIR/company-data"
BACKUP_DIR="$PROJECT_DIR/backups"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/company-backup-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

echo "[$(date)] Backup started" >> "$LOG_FILE"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "[$(date)] ERROR: Source directory missing" >> "$LOG_FILE"
    echo "ERROR: Source directory not found"
    exit 1
fi

if tar -czf "$BACKUP_FILE" -C "$PROJECT_DIR" company-data; then
    if gzip -t "$BACKUP_FILE"; then
        echo "[$(date)] SUCCESS: $BACKUP_FILE" >> "$LOG_FILE"
        echo "Backup completed successfully!"
        echo "Backup location: $BACKUP_FILE"
    else
        echo "[$(date)] ERROR: Backup integrity check failed" >> "$LOG_FILE"
        echo "ERROR: Backup integrity check failed"
        exit 1
    fi
else
    echo "[$(date)] ERROR: Backup creation failed" >> "$LOG_FILE"
    echo "ERROR: Backup creation failed"
    exit 1
fi

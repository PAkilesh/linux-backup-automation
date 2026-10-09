#!/bin/bash

# Project 5 - Backup Retention Script

PROJECT_DIR="$HOME/linux-backup-automation"
BACKUP_DIR="$PROJECT_DIR/backups"
LOG_FILE="$PROJECT_DIR/logs/cleanup.log"

mkdir -p "$BACKUP_DIR" "$PROJECT_DIR/logs"

echo "[$(date)] Cleanup started" >> "$LOG_FILE"

# Remove backup archives older than seven days.
# Keep at least the current recovery archive separate.

find "$BACKUP_DIR" \
    -maxdepth 1 \
    -type f \
    -name "company-backup-*.tar.gz" \
    -mtime +6 \
    -print \
    -delete >> "$LOG_FILE" 2>&1

STATUS=$?

if [ "$STATUS" -eq 0 ]; then
    echo "[$(date)] Cleanup completed successfully" >> "$LOG_FILE"
    echo "Cleanup completed successfully!"
else
    echo "[$(date)] ERROR: Cleanup failed" >> "$LOG_FILE"
    echo "ERROR: Cleanup failed"
    exit 1
fi

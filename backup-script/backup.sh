#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
SOURCE_DIR="/data"
BACKUP_DIR="/backup"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$timestamp.tar.gz" "$SOURCE_DIR"

echo "✅ Backup complete: backup_$timestamp.tar.gz"

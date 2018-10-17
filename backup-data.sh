#!/bin/bash

CLOUD_HOSTNAME=home-primary

DESCRIPTION="$(grep "^$CLOUD_HOSTNAME " ~/.known_ssh_hosts)"
read -r _ _ CLOUD_ADDRESS CLOUD_PORT _ _ <<< "$DESCRIPTION"

echo $CLOUD_ADDRESS:$CLOUD_PORT

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=ssh://borg@$CLOUD_ADDRESS:$CLOUD_PORT/~/repo/data
export BORG_PASSPHRASE='save the data, save me'

DATA_DIRECTORY=$HOME/HostShared/Workspace/Data

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$(date)" "$*" >&2; }
trap 'echo $(date) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
                                    \
    ::'{hostname}-{now}'            \
    $DATA_DIRECTORY                 \

    # --exclude '/home/*/.cache/*'    \
    # --exclude '/var/cache/*'        \
    # --exclude '/var/tmp/*'          \

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 1 ];
then
    info "Backup and/or Prune finished with a warning"
fi

if [ ${global_exit} -gt 1 ];
then
    info "Backup and/or Prune finished with an error"
fi

exit ${global_exit}


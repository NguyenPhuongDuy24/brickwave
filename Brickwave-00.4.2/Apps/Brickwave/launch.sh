#!/bin/sh
# Brickwave for TrimUI Brick Pro StockOS. This launcher changes no firmware.
set -u

appdir=$(CDPATH= cd "$(dirname "$0")" && pwd) || exit 1
cd "$appdir" || exit 1
umask 077
mkdir -p logs run data || exit 1

log_file="$appdir/logs/brickwave.log"
lock_dir="$appdir/run/instance.lock"
pid_file="$lock_dir/launcher.pid"
binary="$appdir/bin/brickwave"

exec >>"$log_file" 2>&1

log() {
    printf '%s component=launcher state=%s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "$1"
}

fail() {
    log "ERROR reason=$1"
    exit 1
}

[ "$(uname -m)" = aarch64 ] || fail aarch64-required
[ -d /usr/trimui ] || fail stockos-runtime-missing
[ -x "$binary" ] || fail binary-missing-or-not-executable
[ -x /lib/ld-linux-aarch64.so.1 ] || fail dynamic-loader-missing
[ -x /usr/trimui/bin/mplayer ] || fail stockos-mplayer-missing

if ! mkdir "$lock_dir" 2>/dev/null; then
    old_pid=
    [ -r "$pid_file" ] && old_pid=$(cat "$pid_file" 2>/dev/null || true)
    if [ -n "$old_pid" ] && kill -0 "$old_pid" 2>/dev/null; then
        fail app-already-running
    fi
    rm -f "$pid_file"
    rmdir "$lock_dir" 2>/dev/null || fail stale-lock-invalid
    mkdir "$lock_dir" || fail lock-create
fi
printf '%s\n' "$$" >"$pid_file" || fail pid-write

child_pid=
cleanup() {
    trap - EXIT TERM INT HUP
    if [ -n "$child_pid" ] && kill -0 "$child_pid" 2>/dev/null; then
        log "STOP_REQUEST pid=$child_pid"
        kill -TERM "$child_pid" 2>/dev/null || true
        wait "$child_pid" 2>/dev/null || true
    fi
    rm -f "$pid_file"
    rmdir "$lock_dir" 2>/dev/null || true
    log CLEANUP_COMPLETE
}

on_signal() {
    cleanup
    exit 128
}

trap cleanup EXIT
trap on_signal TERM INT HUP

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/trimui/lib:/usr/lib:/lib"
export SDL_VIDEODRIVER="${SDL_VIDEODRIVER:-mali}"
# The UI does not open an SDL audio device. StockOS MPlayer remains the only
# ALSA owner. A bounded worker assembles each finite HLS VOD under run/ before
# MPlayer opens it, keeping network jitter out of the audio path.
export SDL_AUDIODRIVER=dummy
export SOUNDCLOUD_MODE=live
export BRICKWAVE_DATA_DIR="$appdir/data"
export BRICKWAVE_RUNTIME_DIR="$appdir/run"

log "APP_START build=00.4.2 mode=live session_store=atomic-file audio=stockos-mplayer mixer=softvol hls_transport=local-vod-spool spool_limit_mib=64 seek=waveform-local waveform=soundcloud-samples ui_playback_fps=30 formats=aac-hls,mp3-hls controls=analog-pointer,a-click,dpad-keyboard,b-close"
/lib/ld-linux-aarch64.so.1 "$binary" &
child_pid=$!
log "PROCESS_STARTED pid=$child_pid"

if wait "$child_pid"; then
    status=0
else
    status=$?
fi
child_pid=
log "APP_EXIT code=$status"
exit "$status"

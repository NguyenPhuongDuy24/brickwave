# Brickwave 00.4.1 - Waveform dynamics

This build keeps the validated 00.3.8/00.3.9 playback, seek, volume and
transparent-logo paths. It changes only the Now Playing metadata/UI path.

- `waveform_url` now travels from the SoundCloud API response through the
  Brickwave Worker, Rust backend model and UI state.
- A bounded background worker accepts only `https://wave.sndcdn.com`, converts
  legacy `.png` URLs to the matching `.json` sample resource and validates the
  returned sample array.
- Now Playing renders those real samples directly with egui. The completed
  portion is orange; the remaining portion uses the theme text colour.
- The separate black waveform panel has been removed. The waveform is painted
  directly on the existing Now Playing card.
- The duplicate transport row inside the Now Playing card has been removed.
  Playback controls remain in the persistent bottom player.
- Visible bars now use RMS energy for each time slice instead of the largest
  single sample. A display curve and vertical headroom keep loud tracks from
  becoming a row of equally tall, clipped bars.

## Install with a card reader

1. Power off the Brick and place the SD card in the PC card reader.
2. Back up `Apps/Brickwave`.
3. Preserve `Apps/Brickwave/data/`; it contains the saved login session.
4. Extract this ZIP at the root of the SD card and replace the Brickwave
   program files. The ZIP contains no `data`, `logs`, or `run` directory.
5. Safely eject the card, boot the Brick and open Brickwave.

## Device check

1. Confirm `APP_START build=00.4.1` in
   `Apps/Brickwave/logs/brickwave.log`.
2. Play a track and open Now Playing by selecting its artwork.
3. Confirm a real waveform appears without a separate black rectangle and
   that quiet and loud sections have visibly different heights.
4. Confirm the orange portion follows playback and dragging it seeks within
   the same track.
5. Confirm there is no duplicate Play/Previous/Next row inside the card and
   the persistent bottom controls still work.
6. Test Pause, Next and exit with B, then copy the log back to the PC.

The production Cloudflare Worker must include the matching `waveform_url`
mapping before live tracks can provide waveform samples. Until then the UI
shows `Waveform unavailable`; it does not fabricate track amplitude data.

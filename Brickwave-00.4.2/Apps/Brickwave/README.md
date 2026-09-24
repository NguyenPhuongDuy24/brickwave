# Brickwave 00.4.2 - D-pad virtual keyboard

This build keeps the playback, login, artwork, waveform and session behavior
from 00.4.1. It adds the reusable `trimui-ui-kit` virtual keyboard to the
global Search field.

## Keyboard controls

- Select the Search field with the analog pointer and A.
- Move the highlighted key with D-pad Left/Right/Up/Down.
- Press and release A to enter the highlighted key.
- Hold a D-pad direction for repeated movement.
- B closes the keyboard without leaving Brickwave.
- `123`, Shift, Space, Backspace, Clear, Search and Close are available.

While the keyboard is open, D-pad input is not forwarded to page scrolling
and A is not forwarded to widgets behind the keyboard. After it closes, the
normal Brickwave controls resume.

## Install with a card reader

1. Power off the Brick and place the SD card in the PC card reader.
2. Back up `Apps/Brickwave`.
3. Preserve `Apps/Brickwave/data/`; it contains the saved login session.
4. Extract this ZIP at the root of the SD card and replace the Brickwave
   program files. The ZIP contains no `data`, `logs`, or `run` directory.
5. Safely eject the card, boot the Brick and open Brickwave.

## Device check

1. Confirm `APP_START build=00.4.2` in
   `Apps/Brickwave/logs/brickwave.log`.
2. Select the Search field with analog + A.
3. Enter `Daft Punk` using D-pad + A. Check Shift, Space and Backspace.
4. Select Search and confirm exactly one request is sent.
5. Open the keyboard again and press B. It must close without exiting the app.
6. Confirm D-pad scrolling and normal playback controls resume after closing.
7. Exit Brickwave normally and copy `Apps/Brickwave/logs/brickwave.log` back
   to the PC.

Expected log markers include `BRICKWAVE_KEYBOARD_OPEN`,
`BRICKWAVE_KEYBOARD_NAV`, `BRICKWAVE_KEYBOARD_INPUT`,
`BRICKWAVE_KEYBOARD_SUBMIT` and `BRICKWAVE_KEYBOARD_CLOSE`. Entered text is
never written to the log.

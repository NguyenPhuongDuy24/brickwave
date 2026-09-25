# Brickwave 00.4.25 - StockOS wake data recovery

- Target: TrimUI Brick Pro StockOS, ARM64.
- Device log from 00.4.24 confirms the StockOS off/wake path settles and UI
  rendering resumes, but the first post-wake backend request can fail with a
  transient `Network` error.
- Wake recovery keeps loaded catalog entries, queue state, waveform samples
  and artwork textures.
- Waveform and artwork clear only transient failure backoff after wake. Both
  wait two seconds for Wi-Fi to settle before starting another network fetch.
- Each waveform fetch uses a fresh bounded-timeout HTTP agent so a socket
  invalidated during sleep is never reused.
- Backend requests disable idle connection pooling, preventing a stale HTTPS
  socket from being reused after Wi-Fi sleep.
- Artwork HTTP now has explicit connect/read/write timeouts, preventing a
  network loss from holding the single artwork worker indefinitely.
- Library and the currently open playlist are retried only when their status
  is Idle or Error. Loaded data is not refreshed or discarded on wake.
- Added URL-free wake diagnostics for app, waveform, artwork and catalog.
- Existing StockOS power ownership, stay-alive behavior and LED-off cleanup
  remain unchanged.
- Transient overlay messages, including `Playing <track>`, auto-dismiss after
  five seconds so they do not keep covering the interface.
- `cargo fmt --check`: PASS.
- `cargo check`: PASS.
- `cargo test`: PASS, 130 passed / 1 ignored network test.
- Windows release build: PASS.
- ARM64 cross-build: PASS.
- ELF: AArch64 PIE, GLIBC maximum 2.33.
- Device test: NOT_TESTED for this build.
- Rollback: `Brickwave-00.4.24-stay-alive-led-off` remains unchanged.

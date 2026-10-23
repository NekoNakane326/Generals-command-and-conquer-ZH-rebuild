GENERALS REVIVAL GRAPHICS COMPATIBILITY FIX 0.6.6
================================================

Use this small cumulative patch after installing the latest GeneralsRevivalv2
full package. It includes the 0.6.5 HUD alignment correction and does not
contain or redownload the multi-gigabyte game data.

FIXED
-----
- Enables Large Address Aware memory access. On 64-bit Windows the 32-bit game
  can now use up to 4 GB instead of failing near the old 2-GB address ceiling.
  This targets late-match paging, missing textures, invisible units, and stalls.
- Replaces drifting frame waits with stable deadline-based pacing and avoids
  adding an extra delay after a real long frame.
- Interpolates ordinary unit transforms between the fixed 30-Hz simulation
  updates, so 60-FPS rendering no longer repeats moving units every other frame.
- Stops DynamicLOD from changing quality during play. The launcher writes a
  stable Low, Balanced, or Visual High profile before every launch.
- Retains the corrected widescreen 18-slot HUD and separate utility column.
- Does not cap AI armies, unit populations, or available forces.

INSTALL
-------
1. Close the game and the Generals Revival launcher.
2. Extract this ZIP.
3. Double-click INSTALL-PATCH.cmd.
4. Start D:\Generals Revival\GeneralsRevival.exe.
5. Choose Balanced and 60 FPS first. Use Low only for a weaker computer.

If the game is installed elsewhere, drag that Generals Revival folder onto
INSTALL-PATCH.cmd.

MULTIPLAYER
-----------
The deterministic simulation remains fixed at 30 Hz; the smoother 60 FPS path
is visual only. Every player must install this same 0.6.6 patch because the
executable and multiplayer manifest have changed. Mixed versions are expected
to report a content mismatch and must not be used together.

ROLLBACK
--------
The installer saves replaced files under:
%LOCALAPPDATA%\GeneralsRevival\Rollback-0.6.6-GraphicsCompatibility

PATCH FILE SHA-256
-----------------
27E250655C8735367C6E0A8E3E5274F9A91116C666713F9187D86D635FBF63A9  !!00_GR_InterfaceFix.big
44BC31F48054198F09E866AE55BB0BB288E85BA75DE0A51DD13EDE7787BB7E67  GeneralsRevival.exe
2B4865089B67A4FEB520D5B5452D8F6B5C41A089485846861C9155B28A51AC0C  generalszh.exe
A3E3BDA226082F21EBA41FB3EB558F3A3A9180FD67BB8161EA7B73B78E081F78  revival-multiplayer.sha256
